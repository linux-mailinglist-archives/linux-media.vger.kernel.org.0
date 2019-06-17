Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81FAE48075
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 13:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfFQLRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 07:17:49 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44427 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfFQLRt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 07:17:49 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N79ly-1ihwra0FNk-017V4f; Mon, 17 Jun 2019 13:17:42 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: dvb_frontend: split dvb_frontend_handle_ioctl function
Date:   Mon, 17 Jun 2019 13:16:52 +0200
Message-Id: <20190617111718.2277220-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190617111718.2277220-1-arnd@arndb.de>
References: <20190617111718.2277220-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:upYYRH6KMdTm/jl5OCVbNn4KgWGMZDIcmATiaGhDYQZpRr1yWLe
 cExWHNCIc+WiciBqTGaHGtsNzeKYFnRGQXM1n+t2V0sPoi2cx0gHKHR+wIfGxSMQRP75+Cb
 DSwAzAAOZj+UrMZ9D+IPi2M8mNcxrFUNVRXO5yAxIA7DD8xrDSkA720vL3s+Ce0Z6JNakLn
 7jOrSnR7fPf2xpYFH5F/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cvJgTMyJlFg=:j7TS26qQq+OSl8j4ep4vij
 YZ4DK4MHAAK1cmCwV/9myYnPQ957JMFhOldsDcAqRN9dwgCFF4UK4iDds3C3q9MJnBGnS2fCc
 zYOUyYn6wobLlF5KdDWx4Ych0pUDhbO+SStug1rpnSO8RDzD9hhjzQ0K7Wg/8jdfJ9XjSq9QO
 mPsh4urMy5GHU9r5YPsulwjhuIZEn0J/GdSppGdF54d6CN1Qh7NVA2U2l1xPGo4kZmoy1Ejgl
 j/Qm9yPAISmyYdChX3lxqZUJGKi0i0f3s49Jf5dB6sA16TfTHKEOSOt6UhvqqndJ310iFc7Yj
 on4+pDnWRsY0/8hx91VfxfXmSOku9+NUYgKuXHvqi2yPUWl7vDxcbHt8FDIT2hpTpqMQOZvyU
 qqXuaolr9yIYz3g51QThsqK8ojE0+9U8pgw0ldFQR7afbRgX3+MECT9+OAWeUYBQ0eDuKBZpx
 ajLnFg2dJHjgxV9p+ciLLh+peoz3+X82CV7PT4Ebw3/fqgZZZlna+ZZVhyw5vamDvQQe1Vxfd
 IIw2D96aICFN+pvpgwgwmh4zCdB0j+/OXdsDwFNn58GQL/ZdxwEsKsTFS/oDlztpV2jhVL+3a
 XE0svIiKHz8LS1uVOi3TXT/EX3p8qv1imrR4wJ9zrxsOlmjM/57d6gQxuN8ey4WUHEtrtrPil
 dPqnuxtpvRkjA0Ox008ChRu5TEPL/SUQOXDIyiF5KIKljfduUUf+A7a/YBU18S3NLvk1NpKFL
 rijPEPYMZWVvtBoIFCV+bSwUgyIAOisk/5E8pA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Over time, dvb_frontend_handle_ioctl() has grown to the point where
we now get a warning from the compiler about excessive stack usage:

drivers/media/dvb-core/dvb_frontend.c: In function 'dvb_frontend_handle_ioctl':
drivers/media/dvb-core/dvb_frontend.c:2692:1: error: the frame size of 1048 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Almost all of this is used by the dtv_frontend_properties structure
in the FE_GET_PROPERTY and FE_GET_FRONTEND commands. Splitting those
into separate function reduces the stack usage of the main function
to just 136 bytes, the others are under 500 each.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/dvb-core/dvb_frontend.c | 140 ++++++++++++++------------
 1 file changed, 77 insertions(+), 63 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 2dc7761a3680..202f0ba5819c 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2314,6 +2314,78 @@ static int dtv_set_frontend(struct dvb_frontend *fe)
 	return 0;
 }
 
+static int dvb_get_property(struct dvb_frontend *fe, struct file *file,
+			    struct dtv_properties *tvps)
+{
+	struct dvb_frontend_private *fepriv = fe->frontend_priv;
+	struct dtv_property *tvp = NULL;
+	struct dtv_frontend_properties getp;
+	int i, err;
+
+	memcpy(&getp, &fe->dtv_property_cache, sizeof(getp));
+
+	dev_dbg(fe->dvb->device, "%s: properties.num = %d\n",
+		__func__, tvps->num);
+	dev_dbg(fe->dvb->device, "%s: properties.props = %p\n",
+		__func__, tvps->props);
+
+	/*
+	 * Put an arbitrary limit on the number of messages that can
+	 * be sent at once
+	 */
+	if (!tvps->num || (tvps->num > DTV_IOCTL_MAX_MSGS))
+		return -EINVAL;
+
+	tvp = memdup_user((void __user *)tvps->props, tvps->num * sizeof(*tvp));
+	if (IS_ERR(tvp))
+		return PTR_ERR(tvp);
+
+	/*
+	 * Let's use our own copy of property cache, in order to
+	 * avoid mangling with DTV zigzag logic, as drivers might
+	 * return crap, if they don't check if the data is available
+	 * before updating the properties cache.
+	 */
+	if (fepriv->state != FESTATE_IDLE) {
+		err = dtv_get_frontend(fe, &getp, NULL);
+		if (err < 0)
+			goto out;
+	}
+	for (i = 0; i < tvps->num; i++) {
+		err = dtv_property_process_get(fe, &getp,
+					       tvp + i, file);
+		if (err < 0)
+			goto out;
+	}
+
+	if (copy_to_user((void __user *)tvps->props, tvp,
+			 tvps->num * sizeof(struct dtv_property))) {
+		err = -EFAULT;
+		goto out;
+	}
+
+	err = 0;
+out:
+	kfree(tvp);
+	return err;
+}
+
+static int dvb_get_frontend(struct dvb_frontend *fe,
+			    struct dvb_frontend_parameters *p_out)
+{
+	struct dtv_frontend_properties getp;
+
+	/*
+	 * Let's use our own copy of property cache, in order to
+	 * avoid mangling with DTV zigzag logic, as drivers might
+	 * return crap, if they don't check if the data is available
+	 * before updating the properties cache.
+	 */
+	memcpy(&getp, &fe->dtv_property_cache, sizeof(getp));
+
+	return dtv_get_frontend(fe, &getp, p_out);
+}
+
 static int dvb_frontend_handle_ioctl(struct file *file,
 				     unsigned int cmd, void *parg)
 {
@@ -2359,58 +2431,9 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 		err = 0;
 		break;
 	}
-	case FE_GET_PROPERTY: {
-		struct dtv_properties *tvps = parg;
-		struct dtv_property *tvp = NULL;
-		struct dtv_frontend_properties getp = fe->dtv_property_cache;
-
-		dev_dbg(fe->dvb->device, "%s: properties.num = %d\n",
-			__func__, tvps->num);
-		dev_dbg(fe->dvb->device, "%s: properties.props = %p\n",
-			__func__, tvps->props);
-
-		/*
-		 * Put an arbitrary limit on the number of messages that can
-		 * be sent at once
-		 */
-		if (!tvps->num || (tvps->num > DTV_IOCTL_MAX_MSGS))
-			return -EINVAL;
-
-		tvp = memdup_user((void __user *)tvps->props, tvps->num * sizeof(*tvp));
-		if (IS_ERR(tvp))
-			return PTR_ERR(tvp);
-
-		/*
-		 * Let's use our own copy of property cache, in order to
-		 * avoid mangling with DTV zigzag logic, as drivers might
-		 * return crap, if they don't check if the data is available
-		 * before updating the properties cache.
-		 */
-		if (fepriv->state != FESTATE_IDLE) {
-			err = dtv_get_frontend(fe, &getp, NULL);
-			if (err < 0) {
-				kfree(tvp);
-				return err;
-			}
-		}
-		for (i = 0; i < tvps->num; i++) {
-			err = dtv_property_process_get(fe, &getp,
-						       tvp + i, file);
-			if (err < 0) {
-				kfree(tvp);
-				return err;
-			}
-		}
-
-		if (copy_to_user((void __user *)tvps->props, tvp,
-				 tvps->num * sizeof(struct dtv_property))) {
-			kfree(tvp);
-			return -EFAULT;
-		}
-		kfree(tvp);
-		err = 0;
+	case FE_GET_PROPERTY:
+		err = dvb_get_property(fe, file, parg);
 		break;
-	}
 
 	case FE_GET_INFO: {
 		struct dvb_frontend_info *info = parg;
@@ -2548,7 +2571,6 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 		fepriv->tune_mode_flags = (unsigned long)parg;
 		err = 0;
 		break;
-
 	/* DEPRECATED dish control ioctls */
 
 	case FE_DISHNETWORK_SEND_LEGACY_CMD:
@@ -2667,22 +2689,14 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 			break;
 		err = dtv_set_frontend(fe);
 		break;
+
 	case FE_GET_EVENT:
 		err = dvb_frontend_get_event(fe, parg, file->f_flags);
 		break;
 
-	case FE_GET_FRONTEND: {
-		struct dtv_frontend_properties getp = fe->dtv_property_cache;
-
-		/*
-		 * Let's use our own copy of property cache, in order to
-		 * avoid mangling with DTV zigzag logic, as drivers might
-		 * return crap, if they don't check if the data is available
-		 * before updating the properties cache.
-		 */
-		err = dtv_get_frontend(fe, &getp, parg);
+	case FE_GET_FRONTEND:
+		err = dvb_get_frontend(fe, parg);
 		break;
-	}
 
 	default:
 		return -ENOTSUPP;
-- 
2.20.0

