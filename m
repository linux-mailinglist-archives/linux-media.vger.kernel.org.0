Return-Path: <linux-media+bounces-42028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D113B4928D
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 17:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7054E3AD301
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6F930DECF;
	Mon,  8 Sep 2025 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo45Df7d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECD30DEB6;
	Mon,  8 Sep 2025 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344065; cv=none; b=hHvg4adGA0TTuSUJSDB5dbRftRY4lfQIf6ZzGifLa6eLgoMOTfQnN311vpU3G4kmIdYUWi+29iFnIio5Cv+7O4SRBwlvF2ga/RVy9bqt/ym3Y55m6RvuoempUtHwweLpnGeLMtkRD1CE4wQSJitPRoxxHEvoqDTwYSDIolwiZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344065; c=relaxed/simple;
	bh=Vu0vJUe9Bhv5lv/7DY0mJ4GbmQUzTzUuUn/IpWhwazo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KyNdjzTnRufd1192CwyqlZm5r6RIC7+MMmln0NkWTXHnEKiJvvj2yn66CN3b+EZbBeSmK0KlOQGzqsn8JXYFzcZlFEZL7QH1AaBVey9oAOrnv4x3Mqdpet8wUxxJgvz9KRrdTCUBtr7pwJogjyQ+mYvxqIOr20OMo2I78tvx1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo45Df7d; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445806e03cso59041065ad.1;
        Mon, 08 Sep 2025 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757344063; x=1757948863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lkz6hMpQCDGC4fhgfsXPVi1ixs2LkQLhUVauixCWXZ8=;
        b=Bo45Df7dNJ7LqvaVBHzOoU8iaS1G5fambW6HYNm9NmlC+zn84itwTTkZss3h4IMGdo
         fWu5Mu2RDreb1OtMCA6FHrXVXF1wLLn01kc8qhcySKMNOF5sx+emyY/PrSeNLxCEAK8d
         4Gvw4VmFAewbxviuYZ5mehJGki5PwSn3lp4vmqgR5rI5oWZqLPpWAuawEHEZ3Q6Rd3v7
         p4f1a+Q3Qx3paKXlpplh2GT9s07FJxMozghZmQB1HyZe/SfnYBCTUZ2YLef9SLOyeO0D
         f33zbjTf3lo/6wamuxT43+Mqlhv1xQMxMVerlmRwtcj2aO7InlLi0XCsV4YLlEjfO92D
         7HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757344063; x=1757948863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lkz6hMpQCDGC4fhgfsXPVi1ixs2LkQLhUVauixCWXZ8=;
        b=wr7f0Lz36NbQslLB90ndL18EsJrABBK8Ra757/Gf6VIpAHv8CZjThNZ4m1Ep/peXs3
         WqwEGOvQ861OcEtqUVLGtMKrYb3Gj5DlXqNOTRceP6vquKcLgeMuVISaUL74sUmNbQHi
         jA4lxqr+GACbmCyEfWqyaqaZlo0ezUo8zJVnEHnNf9TDF0PJ4p6Qjyat2ekJdpNWGR7G
         9BrLlaN2Po1huK4Xy5RGeLwXNfimFoVtqGIWOrdW8WSOWCGaDsKGy6E8wL81jqmo4J9i
         3uF/IXEWhsYNGiSFe5JQeUnbevPT8lSp/Ntxw+qsSa6LCPoeufe6eWUPMsT42ktj9iOW
         5P7A==
X-Forwarded-Encrypted: i=1; AJvYcCWO/ujVgK1yLQfcLhIFEM8nkN3jnlGI1palxtqyHsRKB+GcK8ZYWkfdwoY4kjO70kdl2kJ9PKn8y26iFw0=@vger.kernel.org, AJvYcCXejr83ukUWpOCpwM67b4eOiTCvj3qdwufgfHAF8+taQbUUu2dBAj4HgXmsTYA6bjwrdwEnpp+H@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhZMkAMS0dwDRhfNTFmf9KHxC1Y3+1gqpAsauGO4elnW/4Fnj
	WLTjQv0homyQLI7t73kMyxmgj5PL87VDFXMIstYIT/k5gaP9bRuDw+IE
X-Gm-Gg: ASbGncuinektbDGHI94WsWbyn2r4m0I7bEdnw4lPKW22Ns89GuP2mDCk3mBP6E+rO2i
	mfnaHESFGypKWnZJNouX4K+OIsiXxLVWNrY3KlmTEY2dt8jBB8qVWPRvt/iFv7NIG9pIgLkyteJ
	ZJovse00c9KFmJ7lpVvB5QImzdpcXZgilS3Jrbeh+TNeJrsc1iVW8490gKvVjMIyvtE3rPfYlKl
	oRccz14M4lhlRnqYIgkw9h9Je8YjIE9PEcHpDzBkBGHkcw7rsBKh3Et7+1BMNElKQ6OJtjzQ7rF
	tW7B264bHs2No902rqVtyt9qRHnMxuY3yGkE7l9nYn+zMrTPUe6gwHjANKY4V96BVIjucEdwm92
	F3vPhtBeQnRVN90SxcKq6L2B3PkXEh6soE3GQifStGzgIfoXVbA==
X-Google-Smtp-Source: AGHT+IFKAaMays9/SGGrSNvzXyew/oPjgmPmXjn/FySHc4Dg73/PqRIfKoTxmHvswb+jUa7hzdp3Rw==
X-Received: by 2002:a17:903:2311:b0:24c:c1df:2846 with SMTP id d9443c01a7336-2516e887dcamr112061155ad.21.1757344062755;
        Mon, 08 Sep 2025 08:07:42 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b273e4ad5sm169744005ad.25.2025.09.08.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 08:07:42 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com,
	syzbot+a43c95e5c2c9ed88e966@syzkaller.appspotmail.com
Subject: [PATCH v2 2/2] media: az6007: refactor to properly use dvb-usb-v2
Date: Tue,  9 Sep 2025 00:07:30 +0900
Message-Id: <20250908150730.24560-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908150730.24560-1-aha310510@gmail.com>
References: <20250908150730.24560-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The az6007 driver has long since transitioned from dvb-usb to dvb-usb-v2,
but its implementation is still a mix of dvb-usb and dvb-usb-v2.

Addressing the various issues that arise from this requires comprehensive
refactoring to transition to the dvb-usb-v2 implementation.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+a43c95e5c2c9ed88e966@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a43c95e5c2c9ed88e966
Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 175 +++++++++++++-------------
 1 file changed, 86 insertions(+), 89 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 4202042bdb55..5517675fd0b1 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -39,10 +39,10 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 #define AZ6007_READ_IR		0xb4
 
 struct az6007_device_state {
-	struct mutex		mutex;
 	struct mutex		ca_mutex;
 	struct dvb_ca_en50221	ca;
 	unsigned		warm:1;
+	unsigned		ci_attached:1;
 	int			(*gate_ctrl) (struct dvb_frontend *, int);
 	unsigned char		data[4096];
 };
@@ -97,25 +97,30 @@ static struct mt2063_config az6007_mt2063_config = {
 	.refclock = 36125000,
 };
 
-static int __az6007_read(struct usb_device *udev, struct az6007_device_state *st,
+static int __az6007_read(struct dvb_usb_device *d, struct az6007_device_state *st,
 			    u8 req, u16 value, u16 index, u8 *b, int blen)
 {
 	int ret;
 
+	if (mutex_lock_interruptible(&d->usb_mutex) < 0)
+		return -EAGAIN;
+
 	if (blen > sizeof(st->data)) {
 		pr_err("az6007: tried to read %d bytes, but I2C max size is %lu bytes\n",
 		       blen, sizeof(st->data));
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto end_unlock;
 	}
 
-	ret = usb_control_msg(udev,
-			      usb_rcvctrlpipe(udev, 0),
+	ret = usb_control_msg(d->udev,
+			      usb_rcvctrlpipe(d->udev, 0),
 			      req,
 			      USB_TYPE_VENDOR | USB_DIR_IN,
 			      value, index, b, blen, 5000);
 	if (ret < 0) {
 		pr_warn("usb read operation failed. (%d)\n", ret);
-		return -EIO;
+		ret = -EIO;
+		goto end_unlock;
 	}
 
 	if (az6007_xfer_debug) {
@@ -125,6 +130,8 @@ static int __az6007_read(struct usb_device *udev, struct az6007_device_state *st
 				     DUMP_PREFIX_NONE, b, blen);
 	}
 
+end_unlock:
+	mutex_unlock(&d->usb_mutex);
 	return ret;
 }
 
@@ -134,25 +141,24 @@ static int az6007_read(struct dvb_usb_device *d, u8 req, u16 value,
 	struct az6007_device_state *st = d_to_priv(d);
 	int ret;
 
-	if (mutex_lock_interruptible(&st->mutex) < 0)
-		return -EAGAIN;
-
-	ret = __az6007_read(d->udev, st, req, value, index, b, blen);
-
-	mutex_unlock(&st->mutex);
+	ret = __az6007_read(d, st, req, value, index, b, blen);
 
 	return ret;
 }
 
-static int __az6007_write(struct usb_device *udev, struct az6007_device_state *st,
+static int __az6007_write(struct dvb_usb_device *d, struct az6007_device_state *st,
 			    u8 req, u16 value, u16 index, u8 *b, int blen)
 {
 	int ret;
 
+	if (mutex_lock_interruptible(&d->usb_mutex) < 0)
+		return -EAGAIN;
+
 	if (blen > sizeof(st->data)) {
 		pr_err("az6007: tried to write %d bytes, but I2C max size is %lu bytes\n",
 		       blen, sizeof(st->data));
-		return -EOPNOTSUPP;
+		ret = -EOPNOTSUPP;
+		goto end_unlock;
 	}
 
 	if (az6007_xfer_debug) {
@@ -162,17 +168,21 @@ static int __az6007_write(struct usb_device *udev, struct az6007_device_state *s
 				     DUMP_PREFIX_NONE, b, blen);
 	}
 
-	ret = usb_control_msg(udev,
-			      usb_sndctrlpipe(udev, 0),
+	ret = usb_control_msg(d->udev,
+			      usb_sndctrlpipe(d->udev, 0),
 			      req,
 			      USB_TYPE_VENDOR | USB_DIR_OUT,
 			      value, index, b, blen, 5000);
 	if (ret != blen) {
 		pr_err("usb write operation failed. (%d)\n", ret);
-		return -EIO;
+		ret = -EIO;
+		goto end_unlock;
 	}
 
-	return 0;
+	ret = 0;
+end_unlock:
+	mutex_unlock(&d->usb_mutex);
+	return ret;
 }
 
 static int az6007_write(struct dvb_usb_device *d, u8 req, u16 value,
@@ -181,12 +191,7 @@ static int az6007_write(struct dvb_usb_device *d, u8 req, u16 value,
 	struct az6007_device_state *st = d_to_priv(d);
 	int ret;
 
-	if (mutex_lock_interruptible(&st->mutex) < 0)
-		return -EAGAIN;
-
-	ret = __az6007_write(d->udev, st, req, value, index, b, blen);
-
-	mutex_unlock(&st->mutex);
+	ret = __az6007_write(d, st, req, value, index, b, blen);
 
 	return ret;
 }
@@ -580,10 +585,9 @@ static void az6007_ci_uninit(struct dvb_usb_device *d)
 }
 
 
-static int az6007_ci_init(struct dvb_usb_adapter *adap)
+static int az6007_ci_init(struct dvb_usb_device *d)
 {
-	struct dvb_usb_device *d = adap_to_d(adap);
-	struct az6007_device_state *state = adap_to_priv(adap);
+	struct az6007_device_state *state = d_to_priv(d);
 	int ret;
 
 	pr_debug("%s()\n", __func__);
@@ -600,7 +604,7 @@ static int az6007_ci_init(struct dvb_usb_adapter *adap)
 	state->ca.poll_slot_status	= az6007_ci_poll_slot_status;
 	state->ca.data			= d;
 
-	ret = dvb_ca_en50221_init(&adap->dvb_adap,
+	ret = dvb_ca_en50221_init(&d->adapter[0].dvb_adap,
 				  &state->ca,
 				  0, /* flags */
 				  1);/* n_slots */
@@ -610,6 +614,8 @@ static int az6007_ci_init(struct dvb_usb_adapter *adap)
 		return ret;
 	}
 
+	state->ci_attached = true;
+
 	pr_debug("CI initialized.\n");
 
 	return 0;
@@ -646,8 +652,6 @@ static int az6007_frontend_attach(struct dvb_usb_adapter *adap)
 	st->gate_ctrl = adap->fe[0]->ops.i2c_gate_ctrl;
 	adap->fe[0]->ops.i2c_gate_ctrl = drxk_gate_ctrl;
 
-	az6007_ci_init(adap);
-
 	return 0;
 }
 
@@ -667,8 +671,6 @@ static int az6007_cablestar_hdci_frontend_attach(struct dvb_usb_adapter *adap)
 	st->gate_ctrl = adap->fe[0]->ops.i2c_gate_ctrl;
 	adap->fe[0]->ops.i2c_gate_ctrl = drxk_gate_ctrl;
 
-	az6007_ci_init(adap);
-
 	return 0;
 }
 
@@ -699,50 +701,55 @@ static int az6007_power_ctrl(struct dvb_usb_device *d, int onoff)
 
 	pr_debug("%s()\n", __func__);
 
-	if (!state->warm) {
-		mutex_init(&state->mutex);
+	mutex_lock(&d->i2c_mutex);
 
+	if (!state->warm) {
 		ret = az6007_write(d, AZ6007_POWER, 0, 2, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 		msleep(60);
 		ret = az6007_write(d, AZ6007_POWER, 1, 4, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 		msleep(100);
 		ret = az6007_write(d, AZ6007_POWER, 1, 3, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 		msleep(20);
 		ret = az6007_write(d, AZ6007_POWER, 1, 4, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 
 		msleep(400);
 		ret = az6007_write(d, FX2_SCON1, 0, 3, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 		msleep(150);
 		ret = az6007_write(d, FX2_SCON1, 1, 3, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 		msleep(430);
 		ret = az6007_write(d, AZ6007_POWER, 0, 0, NULL, 0);
 		if (ret < 0)
-			return ret;
+			goto end_unlock;
 
 		state->warm = true;
 
-		return 0;
+		ret = 0;
+		goto end_unlock;
 	}
 
+	ret = 0;
+
 	if (!onoff)
-		return 0;
+		goto end_unlock;
 
 	az6007_write(d, AZ6007_POWER, 0, 0, NULL, 0);
 	az6007_write(d, AZ6007_TS_THROUGH, 0, 0, NULL, 0);
 
-	return 0;
+end_unlock:
+	mutex_unlock(&d->i2c_mutex);
+	return ret;
 }
 
 /* I2C */
@@ -758,7 +765,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	int length;
 	u8 req, addr;
 
-	if (mutex_lock_interruptible(&st->mutex) < 0)
+	if (mutex_lock_interruptible(&d->i2c_mutex) < 0)
 		return -EAGAIN;
 
 	for (i = 0; i < num; i++) {
@@ -781,7 +788,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			value = addr | (1 << 8);
 			length = 6 + msgs[i + 1].len;
 			len = msgs[i + 1].len;
-			ret = __az6007_read(d->udev, st, req, value, index,
+			ret = __az6007_read(d, st, req, value, index,
 					    st->data, length);
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
@@ -802,7 +809,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			index = msgs[i].buf[0];
 			value = addr | (1 << 8);
 			length = msgs[i].len - 1;
-			ret =  __az6007_write(d->udev, st, req, value, index,
+			ret = __az6007_write(d, st, req, value, index,
 					      &msgs[i].buf[1], length);
 		} else {
 			/* read bytes */
@@ -818,7 +825,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			value = addr;
 			length = msgs[i].len + 6;
 			len = msgs[i].len;
-			ret = __az6007_read(d->udev, st, req, value, index,
+			ret = __az6007_read(d, st, req, value, index,
 					    st->data, length);
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
@@ -829,7 +836,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			goto err;
 	}
 err:
-	mutex_unlock(&st->mutex);
+	mutex_unlock(&d->i2c_mutex);
 
 	if (ret < 0) {
 		pr_info("%s ERROR: %i\n", __func__, ret);
@@ -861,7 +868,7 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
 		return -ENOMEM;
 
 	/* Try to read the mac address */
-	ret = __az6007_read(d->udev, state, AZ6007_READ_DATA, 6, 0, mac, 6);
+	ret = __az6007_read(d, state, AZ6007_READ_DATA, 6, 0, mac, 6);
 	if (ret == 6)
 		ret = WARM;
 	else
@@ -870,9 +877,9 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
 	kfree(mac);
 
 	if (ret == COLD) {
-		__az6007_write(d->udev, state, 0x09, 1, 0, NULL, 0);
-		__az6007_write(d->udev, state, 0x00, 0, 0, NULL, 0);
-		__az6007_write(d->udev, state, 0x00, 0, 0, NULL, 0);
+		__az6007_write(d, state, 0x09, 1, 0, NULL, 0);
+		__az6007_write(d, state, 0x00, 0, 0, NULL, 0);
+		__az6007_write(d, state, 0x00, 0, 0, NULL, 0);
 	}
 
 	pr_debug("Device is on %s state\n",
@@ -880,13 +887,6 @@ static int az6007_identify_state(struct dvb_usb_device *d, const char **name)
 	return ret;
 }
 
-static void az6007_usb_disconnect(struct usb_interface *intf)
-{
-	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	az6007_ci_uninit(d);
-	dvb_usbv2_disconnect(intf);
-}
-
 static int az6007_download_firmware(struct dvb_usb_device *d,
 	const struct firmware *fw)
 {
@@ -895,6 +895,19 @@ static int az6007_download_firmware(struct dvb_usb_device *d,
 	return cypress_load_firmware(d->udev, fw, CYPRESS_FX2);
 }
 
+static int az6007_init(struct dvb_usb_device *d)
+{
+	return az6007_ci_init(d);
+}
+
+static void az6007_exit(struct dvb_usb_device *d)
+{
+	struct az6007_device_state *state = d_to_priv(d);
+
+	if (state->ci_attached)
+		az6007_ci_uninit(d);
+}
+
 /* DVB USB Driver stuff */
 static struct dvb_usb_device_properties az6007_props = {
 	.driver_name         = KBUILD_MODNAME,
@@ -912,6 +925,8 @@ static struct dvb_usb_device_properties az6007_props = {
 	.download_firmware   = az6007_download_firmware,
 	.identify_state	     = az6007_identify_state,
 	.power_ctrl          = az6007_power_ctrl,
+	.init                = az6007_init,
+	.exit                = az6007_exit,
 	.num_adapters        = 1,
 	.adapter             = {
 		{ .stream = DVB_USB_STREAM_BULK(0x02, 10, 4096), }
@@ -935,6 +950,8 @@ static struct dvb_usb_device_properties az6007_cablestar_hdci_props = {
 	.download_firmware   = az6007_download_firmware,
 	.identify_state	     = az6007_identify_state,
 	.power_ctrl          = az6007_power_ctrl,
+	.init                = az6007_init,
+	.exit                = az6007_exit,
 	.num_adapters        = 1,
 	.adapter             = {
 		{ .stream = DVB_USB_STREAM_BULK(0x02, 10, 4096), }
@@ -955,37 +972,17 @@ static const struct usb_device_id az6007_usb_table[] = {
 
 MODULE_DEVICE_TABLE(usb, az6007_usb_table);
 
-static int az6007_suspend(struct usb_interface *intf, pm_message_t msg)
-{
-	struct dvb_usb_device *d = usb_get_intfdata(intf);
-
-	az6007_ci_uninit(d);
-	return dvb_usbv2_suspend(intf, msg);
-}
-
-static int az6007_resume(struct usb_interface *intf)
-{
-	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	struct dvb_usb_adapter *adap = &d->adapter[0];
-
-	az6007_ci_init(adap);
-	return dvb_usbv2_resume(intf);
-}
-
 /* usb specific object needed to register this driver with the usb subsystem */
 static struct usb_driver az6007_usb_driver = {
-	.name		= KBUILD_MODNAME,
-	.id_table	= az6007_usb_table,
-	.probe		= dvb_usbv2_probe,
-	.disconnect	= az6007_usb_disconnect,
-	.no_dynamic_id	= 1,
-	.soft_unbind	= 1,
-	/*
-	 * FIXME: need to implement reset_resume, likely with
-	 * dvb-usb-v2 core support
-	 */
-	.suspend	= az6007_suspend,
-	.resume		= az6007_resume,
+	.name = KBUILD_MODNAME,
+	.id_table = az6007_usb_table,
+	.probe = dvb_usbv2_probe,
+	.disconnect = dvb_usbv2_disconnect,
+	.suspend = dvb_usbv2_suspend,
+	.resume = dvb_usbv2_resume,
+	.reset_resume = dvb_usbv2_reset_resume,
+	.no_dynamic_id = 1,
+	.soft_unbind = 1,
 };
 
 module_usb_driver(az6007_usb_driver);
--

