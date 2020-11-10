Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A00D2AD8D3
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 15:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbgKJOay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 09:30:54 -0500
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:37056
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730070AbgKJOax (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 09:30:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuAqz5hzgSGWBQqUi1ZdxuUKem6OZ79uli3NXDuf9yeXPGmZJtzpPKi5cER+XdNb/Bk3lv9RZEVTU3By7vMeoL9EPs9mMZF5l1NRt6PXSiY81Y9XAAVpPlw61qxrBmvblwqpbRnCbEsg5Xr62S017YGzvfsEvOh0O+oIPSLIcReJwosWzw4WC/wU13cYpOrFvKNuyY9sF2hpBAqZCDC2+8PP5VXndLoI3hZ2OkfY9CjhKpvS9PmcAxPc31cXxlidZydps55iHAZWLdnghU0VqGWRDhl/b7mo9WOj/QYkzoZA7CUu2zyt5Cs4d6NUejft7aUmBf066YNG380cJeA0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+fwrQ5bg6jQji/k+oYT5Z48k/oj7/qNWMefyHWQLDs=;
 b=gOnuO7SGUVgKtfFbryBp8C3KjGW30CIZTE52VUmX7yT0CPrDpIz1B4uHq/ntCswyFuuN02mbJzugpA5UNZnP97dTBQ7R1D58vY7pSjyz1Ax0g4Gps38K2eQ6iblw5YmPRpKBtSNzpevbrEmklJTqx9PuJlhBsI7cPUf/QwTDltFadZtqvatxbmQEAe5eR97ZncWVEcSylENft4I5ZG+deQZLFg5q4XvnzrlLNRLhi53StgtL2XOo61cM2hIHGJpaVF7IfWATeZeOqcFkcG762rgOyaLNgaJb5TmH5jdqcHHIKojH1To075JIJImoXXE2TGxA97cS7MpN08yioat/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+fwrQ5bg6jQji/k+oYT5Z48k/oj7/qNWMefyHWQLDs=;
 b=MKqX7FEXvRdyIn0KWVUfS4O8iMihAjiKJstsL2+czCJq92zTVvPyDAyzoNOZ/sRi8l45ZCaNofmWUbMs6K7gmiP+rjJWojOtazwlLYZtJEaHWGFNC9q8bEJtNdDRmA3gYR+b+dk+SoQar1y8g0Ho6jKDzRh+agWkeqEbbV6sshg=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR08MB4368.eurprd08.prod.outlook.com (2603:10a6:803:fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 14:30:47 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 14:30:47 +0000
From:   thomas.haemmerle@wolfvision.net
To:     gregkh@linuxfoundation.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        hverkuil@xs4all.nl, linux-usb@vger.kernel.org,
        m.tretter@pengutronix.de, linux-media@vger.kernel.org,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Subject: [PATCH v3] usb: gadget: uvc: fix multiple opens
Date:   Tue, 10 Nov 2020 15:30:15 +0100
Message-Id: <20201110143015.15134-1-thomas.haemmerle@wolfvision.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <X6pmMFYmzO088p4g@kroah.com>
References: <X6pmMFYmzO088p4g@kroah.com>
Content-Type: text/plain
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1P195CA0074.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::27) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wvls01.wolfvision-at.intra (91.118.163.37) by VI1P195CA0074.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 14:30:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc9bffd-10a7-4ead-6a40-08d8858536d8
X-MS-TrafficTypeDiagnostic: VI1PR08MB4368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB436865260E7B8395A8E785B1EDE90@VI1PR08MB4368.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmqOBSPlPzOPX8Z1R1QYerjyHgF2Jn3ohir+um7RVyVvrlQDrF+MTo4410dO+Yydt+E8Kev5G+JbZmPQhl+Aim96p0vtx5Gr5B+8l8zS2f2o796kqNN8FwCOYUzItUjEYwEMT1FmZgLsXg+qDLlmmUMzjyJkOv4eUeIUVSu6JakuOC+68ZN+FvsYtXDF0SgazZsHHbQxbLGo9TAy59bbPJgaxJz4qWCV9Tfa4QAaWZ6AlztaQyJ8ReSD8zNWLGU5L8LtrHRt1Yq3l+eyoor8820lceoS2AXlIpGUh0k0ENlEfCCVI1xYzMQx9lo1pt1B1zjX5+wif2H0vIbDxppE+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39840400004)(376002)(396003)(316002)(6486002)(6666004)(86362001)(5660300002)(107886003)(186003)(2906002)(6512007)(36756003)(956004)(26005)(9686003)(4326008)(66556008)(52116002)(8676002)(8936002)(66476007)(1076003)(16526019)(478600001)(66946007)(2616005)(6916009)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QdspLon4zh0hLSRtA+ongvt91eyCqTj/WRLlUNcSZi3jLMzr1iWfsQcMSPWHlWuzyNqvlALjYlIC4T+h0Kg6tgrlmW5QKm/nRz5c85Sw1GO8UFVgsxO1Z6euJEa6/XYTCwT0uyMQRAzzRIpyMJo7pmgkk8GInJR73LLyqMQ6429Hf++w1MvSHsaRG/W3CEmYoOcP1KYq48esF5J1wiF+EYL46N2aOu56nkNv+5h/34H+EM3fzOsOyE1wL8k9HQQcnvjGPIdueUNMYaLmWQnxeDHEnNRcKNuXaLI7LDK39uu5/3yopr3wexG3iZWOBq31x8sq9OyrBm72w6BPyFimWqfo+zpzlpmy9Jci+lEi9zDYpwgjJLhn+m0zTr2Sw1viYHxFCeSlezU69NUlR6drvxRcJEBKz7yQRFIWuwxqW4Mb3Cl2dZlUBcIXlL7YsQiUDzSaQD4L5JxrNF1TvaW5r3hsGUXQKA2COG+0tWP4T6iy7xc6ys1/HrWHbqlEUyTrDJ3A2mMe/QqfJOoz03uzaakA/rcvUhfP1787SQaeAGKk1f+0wIIQJqs55+UaM+85ArA+3r2GY19R8VGykhTrHanxS6VX/Mnhe84fTwjo6NmsLO6KK/EhfBT4nR/C7puj0m54k7HwcK9Corw3FRNHnst+akx9acN0sd5Yp0siQK6GjX+OLp5VPiFV82jAhQ/fFCvItc/N7vrRRhphFzqICRSeCEn50ImJeRu/KtQEjTl8RBd1TfUNuFlMbsif3qRf4/H0FOnReJdKBsQ12ADAgmGaM/gyIGogLajOG+UUJ2aZ8d/q6S2gyGKKijXCaWpxiLZ8Bgyq+wb1/h43WxnV776E4OHaSbxmawBgRyJkOqlK2rFN/0d5LycU0vwcdgjZIHunWlhtxDM8zQyJ4Z7atA==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc9bffd-10a7-4ead-6a40-08d8858536d8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 14:30:47.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FNS3fEsxVEtFnEA5V+Ngnp9KLy2kCRx/2NTUztKQkrhlqGHmYGdwDulhfYCXUSSwVFy7AXq4oqSlr2aDCVhyPdhrHoND/jKiY/x28BPN+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4368
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>

Currently, the UVC function is activated when open on the corresponding
v4l2 device is called.
On another open the activation of the function fails since the
deactivation counter in `usb_function_activate` equals 0. However the
error is not returned to userspace since the open of the v4l2 device is
successful.

On a close the function is deactivated (since deactivation counter still
equals 0) and the video is disabled in `uvc_v4l2_release`, although the
UVC application potentially is streaming.

Move activation of UVC function to subscription on UVC_EVENT_SETUP
because there we can guarantee for a userspace application utilizing UVC.
Block subscription on UVC_EVENT_SETUP while another application already
is subscribed to it, indicated by `bool func_connected` in
`struct uvc_device`.
Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
to tag it as the handle used by the userspace UVC application.

With this a process is able to check capabilities of the v4l2 device
without deactivating the function for the actual UVC application.

Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
---
v3:
 - replace `unsigned int connections` with `bool func_connected`
 - rename `bool connected` to `bool is_uvc_app_handle`

v2:
 - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
   locked in v4l2-core) introduced in v1
 - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
   connected

 drivers/usb/gadget/function/uvc.h      |  2 +
 drivers/usb/gadget/function/uvc_v4l2.c | 54 +++++++++++++++++++++-----
 2 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 73da4f9a8d4c..d6d0fd2dffa0 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -117,6 +117,7 @@ struct uvc_device {
 	enum uvc_state state;
 	struct usb_function func;
 	struct uvc_video video;
+	bool func_connected;
 
 	/* Descriptors */
 	struct {
@@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
 struct uvc_file_handle {
 	struct v4l2_fh vfh;
 	struct uvc_video *device;
+	bool is_uvc_app_handle;
 };
 
 #define to_uvc_file_handle(handle) \
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 67922b1355e6..3c0b7a969107 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -228,17 +228,55 @@ static int
 uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 			 const struct v4l2_event_subscription *sub)
 {
+	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
+	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
+	int ret;
+
 	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
 		return -EINVAL;
 
-	return v4l2_event_subscribe(fh, sub, 2, NULL);
+	if ((sub->type == UVC_EVENT_SETUP) && uvc->func_connected)
+		return -EBUSY;
+
+	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (sub->type == UVC_EVENT_SETUP) {
+		uvc->func_connected = true;
+		handle->is_uvc_app_handle = true;
+		uvc_function_connect(uvc);
+	}
+
+	return 0;
+}
+
+static void uvc_v4l2_disable(struct uvc_device *uvc)
+{
+	uvc->func_connected = false;
+	uvc_function_disconnect(uvc);
+	uvcg_video_enable(&uvc->video, 0);
+	uvcg_free_buffers(&uvc->video.queue);
 }
 
 static int
 uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
 			   const struct v4l2_event_subscription *sub)
 {
-	return v4l2_event_unsubscribe(fh, sub);
+	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
+	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
+	int ret;
+
+	ret = v4l2_event_unsubscribe(fh, sub);
+	if (ret < 0)
+		return ret;
+
+	if ((sub->type == UVC_EVENT_SETUP) && handle->is_uvc_app_handle) {
+		uvc_v4l2_disable(uvc);
+		handle->is_uvc_app_handle = false;
+	}
+
+	return 0;
 }
 
 static long
@@ -293,7 +331,6 @@ uvc_v4l2_open(struct file *file)
 	handle->device = &uvc->video;
 	file->private_data = &handle->vfh;
 
-	uvc_function_connect(uvc);
 	return 0;
 }
 
@@ -303,14 +340,11 @@ uvc_v4l2_release(struct file *file)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
-	struct uvc_video *video = handle->device;
-
-	uvc_function_disconnect(uvc);
 
-	mutex_lock(&video->mutex);
-	uvcg_video_enable(video, 0);
-	uvcg_free_buffers(&video->queue);
-	mutex_unlock(&video->mutex);
+	mutex_lock(&uvc->video.mutex);
+	if (handle->is_uvc_app_handle)
+		uvc_v4l2_disable(uvc);
+	mutex_unlock(&uvc->video.mutex);
 
 	file->private_data = NULL;
 	v4l2_fh_del(&handle->vfh);
-- 
2.17.1

