Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E0E17D6F6
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 00:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgCHXMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Mar 2020 19:12:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60504 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgCHXMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Mar 2020 19:12:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C7A091C0316; Mon,  9 Mar 2020 00:12:07 +0100 (CET)
Date:   Mon, 9 Mar 2020 00:12:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     "Arthur D." <spinal.by@gmail.com>, sakari.ailus@iki.fi,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>
Subject: [PATCH] et8ek8: Support for EXPOSURE_ABSOLUTE
Message-ID: <20200308231206.GC31247@amd>
References: <20200302115446.GA22299@duo.ucw.cz>
 <01c78e68-c83d-746b-972b-ce71952b9e14@wizzup.org>
 <20200305205216.GA4712@duo.ucw.cz>
 <20200307114526.GA21933@duo.ucw.cz>
 <op.0g5ww1n7hxa7s4@supervisor.net28>
 <aa625ac3-dbdc-dacd-ba79-c6d71fbe782a@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <aa625ac3-dbdc-dacd-ba79-c6d71fbe782a@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

To do a good job taking photos, userland needs to be able to query/set
exposure in absolute units. (As scene gets darker, exposure time
should be increased to cca 1/100 second -- based on scene type -- then
sensitivity should be stepped up to maximum reasonable value, only
then time should be increased again). This patch provides neccessary
support.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

---

I have experimental version of sdlcam that can take photos, and this
is the most important missing piece.

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/e=
t8ek8/et8ek8_driver.c
index 256acf73d5ea..82d59691c788 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -50,6 +50,8 @@ struct et8ek8_sensor {
=20
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *exposure_abs;
+	u32 cur_exposure;
 	struct v4l2_ctrl *pixel_rate;
 	struct et8ek8_reglist *current_reglist;
=20
@@ -546,6 +548,65 @@ static int et8ek8_reglist_import(struct i2c_client *cl=
ient,
 	return 0;
 }
=20
+typedef unsigned int fixpoint8; /* .8 fixed point format. */
+
+/*
+ * Return time of one row in microseconds
+ * If the sensor is not set to any mode, return zero.
+ */
+fixpoint8 et8ek8_get_row_time(struct et8ek8_sensor *sensor)
+{
+	unsigned int clock;	/* Pixel clock in Hz>>10 fixed point */
+	fixpoint8 rt;	/* Row time in .8 fixed point */
+
+	if (!sensor->current_reglist)
+		return 0;
+
+	clock =3D sensor->current_reglist->mode.pixel_clock;
+	clock =3D (clock + (1 << 9)) >> 10;
+	rt =3D sensor->current_reglist->mode.width * (1000000 >> 2);
+	rt =3D (rt + (clock >> 1)) / clock;
+
+	return rt;
+}
+
+/*
+ * Convert exposure time `us' to rows. Modify `us' to make it to
+ * correspond to the actual exposure time.
+ */
+static int et8ek8_exposure_us_to_rows(struct et8ek8_sensor *sensor, u32 *u=
s)
+{
+	unsigned int rows;	/* Exposure value as written to HW (ie. rows) */
+	fixpoint8 rt;	/* Row time in .8 fixed point */
+
+	/* Assume that the maximum exposure time is at most ~8 s,
+	 * and the maximum width (with blanking) ~8000 pixels.
+	 * The formula here is in principle as simple as
+	 *    rows =3D exptime / 1e6 / width * pixel_clock
+	 * but to get accurate results while coping with value ranges,
+	 * have to do some fixed point math.
+	 */
+
+	rt =3D et8ek8_get_row_time(sensor);
+	rows =3D ((*us << 8) + (rt >> 1)) / rt;
+
+	if (rows > sensor->current_reglist->mode.max_exp)
+		rows =3D sensor->current_reglist->mode.max_exp;
+
+	/* Set the exposure time to the rounded value */
+	*us =3D (rt * rows + (1 << 7)) >> 8;
+
+	return rows;
+}
+
+/*
+ * Convert exposure time in rows to microseconds
+ */
+static int et8ek8_exposure_rows_to_us(struct et8ek8_sensor *sensor, int ro=
ws)
+{
+	return (et8ek8_get_row_time(sensor) * rows + (1 << 7)) >> 8;
+}
+
 /* Called to change the V4L2 gain control value. This function
  * rounds and clamps the given value and updates the V4L2 control value.
  * If power is on, also updates the sensor analog and digital gains.
@@ -637,18 +698,22 @@ static int et8ek8_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct et8ek8_sensor *sensor =3D
 		container_of(ctrl->handler, struct et8ek8_sensor, ctrl_handler);
+	u32 val =3D ctrl->val;
=20
 	switch (ctrl->id) {
 	case V4L2_CID_GAIN:
 		return et8ek8_set_gain(sensor, ctrl->val);
=20
+	case V4L2_CID_EXPOSURE_ABSOLUTE:
+		val =3D et8ek8_exposure_us_to_rows(sensor, &val);
+		/* Fall through */
+
 	case V4L2_CID_EXPOSURE:
 	{
-		struct i2c_client *client =3D
-			v4l2_get_subdevdata(&sensor->subdev);
-
+		struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->subdev);
+		sensor->cur_exposure =3D val;
 		return et8ek8_i2c_write_reg(client, ET8EK8_REG_16BIT, 0x1243,
-					    ctrl->val);
+					    val);
 	}
=20
 	case V4L2_CID_TEST_PATTERN:
@@ -662,8 +727,28 @@ static int et8ek8_set_ctrl(struct v4l2_ctrl *ctrl)
 	}
 }
=20
+static int et8ek8_get_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct et8ek8_sensor *sensor =3D
+		container_of(ctrl->handler, struct et8ek8_sensor, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE_ABSOLUTE:
+		ctrl->val =3D et8ek8_exposure_rows_to_us(sensor, sensor->cur_exposure);
+		return 0;
+
+	case V4L2_CID_EXPOSURE:
+		ctrl->val =3D sensor->cur_exposure;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct v4l2_ctrl_ops et8ek8_ctrl_ops =3D {
 	.s_ctrl =3D et8ek8_set_ctrl,
+	.g_volatile_ctrl =3D et8ek8_get_ctrl,
 };
=20
 static const char * const et8ek8_test_pattern_menu[] =3D {
@@ -697,6 +782,13 @@ static int et8ek8_init_controls(struct et8ek8_sensor *=
sensor)
 			v4l2_ctrl_new_std(&sensor->ctrl_handler,
 					  &et8ek8_ctrl_ops, V4L2_CID_EXPOSURE,
 					  min, max, min, max);
+
+		min =3D et8ek8_exposure_rows_to_us(sensor, 1);
+		max =3D et8ek8_exposure_rows_to_us(sensor, max);
+
+		sensor->exposure_abs =3D
+			v4l2_ctrl_new_std(&sensor->ctrl_handler, &et8ek8_ctrl_ops,
+					  V4L2_CID_EXPOSURE_ABSOLUTE, min, max, min, max);
 	}
=20
 	/* V4L2_CID_PIXEL_RATE */
@@ -738,8 +830,12 @@ static void et8ek8_update_controls(struct et8ek8_senso=
r *sensor)
 	 */
 	pixel_rate =3D ((mode->pixel_clock + (1 << S) - 1) >> S) + mode->width;
 	pixel_rate =3D mode->window_width * (pixel_rate - 1) / mode->width;
+	__v4l2_ctrl_modify_range(sensor->exposure, 1, max, 1, max);
+
+	min =3D et8ek8_exposure_rows_to_us(sensor, 1);
+	max =3D et8ek8_exposure_rows_to_us(sensor, max);
+	__v4l2_ctrl_modify_range(sensor->exposure_abs, min, max, min, max);
=20
-	__v4l2_ctrl_modify_range(ctrl, min, max, min, max);
 	__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate, pixel_rate << S);
 }
=20


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5le8YACgkQMOfwapXb+vJUCgCffOkawmjSSg1cxtyOVWLf2I0o
LGAAn1cnvxHV5lNpDMJpvdhbJzXy5zQv
=8zMx
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
