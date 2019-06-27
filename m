Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C930058A54
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfF0S5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:19 -0400
Received: from mout.gmx.net ([212.227.15.15]:38093 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbfF0S5R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661815;
        bh=CxR7qSbQJEaTRwxTiS+9LyZFjaKPowlzspE7tanqC4o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Pai7wbgycEoUg5qAS6HYlSD/ehYwSGEWsLpBVwiL2vYbs2SUgRAf/mvvIG1YeojoC
         InlMtIcI9wv2WuW1tOAXgahRoHOjmoOwK+toSBDunI/bffWKltwDNkGeXTXzts5nFp
         QnFFxfUQA+Q4deVBYSthIRhSfFWgTeK7HA4qK0k0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MgcTf-1ht0Hg2sy7-00O07w; Thu, 27 Jun 2019 20:56:55 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 18/31] staging: bcm2835-camera: Set sequence number correctly
Date:   Thu, 27 Jun 2019 20:56:15 +0200
Message-Id: <1561661788-22744-19-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:uglTV20dj89zG+7dc69VnabOIsvQyrYIv6qLM7blISuaYJWxuhz
 9njdmJ+t/4DkTqLssoOh56a7uaO872TVNVSzzECWQKF0YX6njhk42XhLpXCDcP8uIU5zzuB
 X6EDxNHPcSI3+qK58uzHanyRITAW1bwqMwAhZZoUOfFiP0wxHZ5ZlrrnbLAVWJAKeCayEsy
 T3Ws5NxW40gK9NyMmmZ2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9h9q/Aa03ak=:xIVl/nRJKGM6dJxwREUv+8
 g87d2J8v35Vt8bnrGRUY9OFqWPBZPh6+ehE1KNyQEyxx/Q1f6Nmo9oE0kCCG0mpUgpuxnFi1X
 v6yAjUE74rywqEjaRThq0H4rMIS2dIswJ4ggc5VKeV8JgaAwS4OFd9U1k5X5Nwt/+Wgxm7M8c
 jsNGPRSPVlyaseZfU9tbrhShkIZvrIc8ifDMHgqZrjXeTYru0gserP/sfHYpv9S3O4QlhJYG/
 IG3lkvVDv98ZwtiCu6r4JTToXSb85RsgfgTpJAi0fAbZBcE3nSkVkcX32VEesrSTZOnYHWU69
 HZLjH3MraQMqOvgWNVqpTTE3PvGTkegZnrbV6IcVpKVwcROVZ+1vyZ3019Gu1f2GN5VUNAkDi
 aXdD6hbxc/i7FjFD+QGBiTGNVV1G4/0d3zquQz/ykJnJHspHf4Cl5DG9tufY/7CldD+2oiEmU
 CgU9F0EcaCowEj8DpnCUeO6XI3Slf8ndTRfCURlZ7qF9KoFjiPU2l6Ltb8q5bhAOyVePt7KWr
 4hHrhUE5Dj1KS437cccjJS4buKfxe/F6rY7uZb594dmBCIWsyvuofc3TGoXXHmcCU0Qzm1wBK
 7+DRtqwYuYSGVfbaO3JSbEn0Phuf8YYG9qDtnfQgq1w93fMaN1olbOwrRClGm82zqspkBi+tS
 9Q6HX6okdn5X+nb4eGHJZAtEjzF6Y0u655wfy+LGHppZdt+jy7mMRGtITdjrfJ1Gv2EqxQGHC
 kmHKmBIbq3ty9Mc2ZfX1+V/qLA9iKZkFdqyKRHutWQmtExbeSZfYB+A7WsfTiJuSkHLCMv0BZ
 L5Zag5enKZHA8WlvZSnm9cUkrMxJf6Vm9ct2N/8qLLynBhffZNRJV0zGn8iWwBF7EZzOJ53y0
 JgtQtMIymJ4SIdF8F9qsbhdYoYrw0RWScF6sVTMmDA6UfYm+1FTGGHEcAeBehEbeBT3Egh10/
 74zJOMDMZdBN4rpcki6SvWq7larnVURMhfHqnUv6iBCfKQT6D/iMaU0s6TVcQ93ZEz1Tq1LSF
 YxkKzHc4H0hgRUjbLMwB58I24PdTIV5GuuBTGgxoyz5MHTd2LeyrZFKgniMKfJMhSjebZCmO7
 7RDxhKcpyiM/wo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Set the sequence number in vb2_v4l2_buffer mainly so the
latest v4l2-ctl reports the frame rate correctly.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 4 ++++
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index f2e951c..9967df9 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -398,6 +398,7 @@ static void buffer_cb(struct vchiq_mmal_instance *inst=
ance,
 		}
 	}
 	dev->capture.last_timestamp =3D buf->vb.vb2_buf.timestamp;
+	buf->vb.sequence =3D dev->capture.sequence++;

 	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
 	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
@@ -525,6 +526,9 @@ static int start_streaming(struct vb2_queue *vq, unsig=
ned int count)
 	/* enable frame capture */
 	dev->capture.frame_count =3D 1;

+	/* reset sequence number */
+	dev->capture.sequence =3D 0;
+
 	/* if the preview is not already running, wait for a few frames for AGC
 	 * to settle down.
 	 */
diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
index bbfe8fe..c821513 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
@@ -93,6 +93,8 @@ struct bm2835_mmal_dev {
 		ktime_t kernel_start_ts;
 		/* Timestamp of last frame */
 		u64		last_timestamp;
+		/* Sequence number of last buffer */
+		u32		sequence;

 		struct vchiq_mmal_port  *port; /* port being used for capture */
 		/* camera port being used for capture */
=2D-
2.7.4

