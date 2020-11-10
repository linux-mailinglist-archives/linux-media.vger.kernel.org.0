Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4FB2AD139
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 09:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgKJIZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 03:25:26 -0500
Received: from mail-eopbgr60084.outbound.protection.outlook.com ([40.107.6.84]:41414
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726213AbgKJIZZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 03:25:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRiwTzBFeBZVMJTvqvEJEVMCHSRXVVMlzTf9X9RS9gOpl0e81R2axGOx7adFTv+W1fHPGae4iUH9pzyUj1nrgvfB9qLeyIw99IaS+hvYeJ/KZvOVXeZFtU9okrW908sDMepqOM06rNiNjTR6nvfUAd5pJ2OJH/KnjL14gU+bn3Ty64g3mZQmgUXS59H/Dfdmi03V508ajTH22WvzOq+PfeChHh6h+K5KmE/JNj/coCe6NfVeVEtEaNFVlFJ72YW4GK2m7c8xiEQ+39k76V9nYE8JDSXLcYgr81RymgSlDVKcuaG8Gdb4Yi+YoOAWTX5PCDGyYqW9tAsWz3taDyqDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAaRGyaFvUdcJKPlwWqr1+g4a2JlcA9m+B7TC3vgtMM=;
 b=TpFo/Y7abgtH97elrIUeV+F3Gz9VxCbPRBLvwr9WJ9Jy/ANnPo+Im53ErvcGdHMXjCQUWeNXKetASq1w1hnxrewjrOev2t5il9d6qCQ8rmqBjOTZR23WvjX5YLwRZcucOzUjxY73AvSyKEjTplnZHZQB4REO6OYEqlzv2iLv0p2TlwlKnqaV7yy1n6waQjDbIZxEHD5WuATmdwFcJ2EGQnEU1M2WO6mDGD5VyNu5CFXj0sWozLMy2DRdXcq1iK+1c1UkomQxwvd7PGeqLeNANgRYD83pezOlbyTvGBtqApYfoLlvNq3DJP+3XLYPqD65breWlFXfFYxsUansNFuLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAaRGyaFvUdcJKPlwWqr1+g4a2JlcA9m+B7TC3vgtMM=;
 b=zVUMGSH6IsSfy/oaXdR5ZGPmn+lDXN5Q/6OL4EBJYY5FZhquzc4mPVDHoSzxO6qd5q9bawNeIler4bpaHi/ViNIuZ4iyC5lYyDZ1ztRAfo/GR+5601DxfPRg3XUd6rxnDEDAU3Akxjbhn91WWB0W+ZtrA0z/JXH1VyGX0z4SGQs=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR0802MB2175.eurprd08.prod.outlook.com (2603:10a6:800:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 08:25:19 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 08:25:19 +0000
From:   thomas.haemmerle@wolfvision.net
To:     gregkh@linuxfoundation.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Subject: [PATCH v2] usb: gadget: uvc: fix multiple opens
Date:   Tue, 10 Nov 2020 09:25:04 +0100
Message-Id: <20201110082504.26134-1-thomas.haemmerle@wolfvision.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105103758.GA4033354@kroah.com>
References: <20201105103758.GA4033354@kroah.com>
Content-Type: text/plain
X-Originating-IP: [91.118.163.37]
X-ClientProxiedBy: VI1PR09CA0094.eurprd09.prod.outlook.com
 (2603:10a6:803:78::17) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wvls01.wolfvision-at.intra (91.118.163.37) by VI1PR09CA0094.eurprd09.prod.outlook.com (2603:10a6:803:78::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 08:25:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b59f61e-dc51-44da-0732-08d8855228fe
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2175:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB21751F9539CC5AA3DC32E022EDE90@VI1PR0802MB2175.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTu+lSsbi/EMhJjssdwTtxEdBtuvBR4EiVOsNhjRRgrfEVRcpOdLnzmXaWii4380idDugBfMC+C2vfXQvLVYogVvPHghL21zFlQOn7pVP0tXgM19wJPHYQ+ciS8eI9bOWHNgxQYkb5m5W0R62vWeuRgDKyDv2umwIpp9qvyLPhcYhq1UonyC5WpwDLhTVUVfMraRMWZr6y4Pgcyl98DuI7VDfCU/0QKkOGA/kvWaj/2Y4ViAnZ12o+M0SvDg0SsRfYXL+7xpGHXDlLOCIzj/pMFeQHYJfWPDL8MOuQbSnRAl7xl7e7iVrN96iloz93e5RHpf3rADWm2Tw5XGJVkgaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(6916009)(86362001)(83380400001)(5660300002)(26005)(186003)(6666004)(4326008)(316002)(66946007)(478600001)(2906002)(1076003)(8936002)(8676002)(107886003)(2616005)(16526019)(956004)(52116002)(6506007)(6486002)(6512007)(9686003)(36756003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: OtxaToyGbTPgB5VoATBxG18jsDBCX828Rl6ttzZd2PmbuoRDlWHvB5KLNfQuz1M3PoTXA8ZbW+s/6ntPa3SPME6uDz0f3j8wMlt/t42xHea0yEf/hxp6PSQM2aw0iQoGb+derSZJaR1zr39Bvt23uKA8BRyApC3zYTRgmld3thDNXdm+EJAGZYfOakT6l+s7vxvPh+gRjQ4O+645/UHX9MngV2U5ScPD9za3FacpVfJoVNfffMzvT71BS1jE9jUCpyqc0fi+UWEE8vwOOVb8MUyKoL1B2dqESkZQGRpr1iWc6Ebt7Nyov7nOpst21AiUMQYUoNfzAlGDU0v7ivuo44rH5bDa0EB9d76HUOojOBUnfryIkR0MOv+WNcQtieHusH1cLA7efYbl+Zlpyg2HuTbbLd7w1+itjL/ZFm9NQz151W5NdxQH3EWhxXvmku3PTdVm7/Q1lIwC0Eb4W1o5BuGyS1BWaZY673Vr0+Td+wzrujHFONLutUJrVsx0ddHUZhCqhG7081IdQi0nSLReWSg6P1lNeWBGIUvfanN2ljTvm/LBZ8IuxiK0exmdUmEbMZvLKINDew1Jjw3ydnPEVSGSJZ/xc2inTvjxcbZth8kRtmfTdrDbZ0UwN4KoO/Ipphwk9QJ3yz5nN33VZV3k+/BXjycnHuCki5uZHgpQgGDYm0kHnbM97rk4UOtmORgKGg8B0oa7jcDr3h83hkrmcoIkIw2z4umGU9KcreS2N0ZHI2XX83NibqIIMErq0Vh86d8tCpi9JD7zptH1uNZi4Yu0aI7Ph2lct1zt4cg0Q33L9kYu49elOODYO2voJfijwyJ9/BntH2pzKXn6xbmnsY87zKZJ//exIAhn6byStXE2OCo24nsXpREb5RDwbqBaDuuJOoQ12KGZ0t31DwU2qA==
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b59f61e-dc51-44da-0732-08d8855228fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 08:25:19.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9tHr7/Ew90SRn400jFBuRpikNjPQV7ZmCGSOgz8YWUJvsOpxtAkXOziSN1YuFSp5ap639Rt92Irn8Q8HpXK3usSXtZqaCEEyPODxZy5HAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2175
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
equals 0) and the video is disabled in `uvc_v4l2_release`, although
another process potentially is streaming.

Move activation of UVC function to subscription on UVC_EVENT_SETUP and
keep track of the number of subscribers (limited to 1) because there we
can guarantee for a userspace program utilizing UVC.
Extend the `struct uvc_file_handle` with member `bool connected` to tag 
it for a deactivation of the function.

With this a process is able to check capabilities of the v4l2 device
without deactivating the function for another process actually using the
device for UVC streaming.

Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
---
v2:
 - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
   locked in v4l2-core) introduced in v1
 - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
   connected

 drivers/usb/gadget/function/uvc.h      |  2 +
 drivers/usb/gadget/function/uvc_v4l2.c | 56 +++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 73da4f9a8d4c..0d0bcbffc8fd 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -117,6 +117,7 @@ struct uvc_device {
 	enum uvc_state state;
 	struct usb_function func;
 	struct uvc_video video;
+	unsigned int connections;
 
 	/* Descriptors */
 	struct {
@@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
 struct uvc_file_handle {
 	struct v4l2_fh vfh;
 	struct uvc_video *device;
+	bool connected;
 };
 
 #define to_uvc_file_handle(handle) \
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 67922b1355e6..aee4888e17b1 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -228,17 +228,57 @@ static int
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
+	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
+		return -EBUSY;
+
+	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (sub->type == UVC_EVENT_SETUP) {
+		uvc->connections++;
+		handle->connected = true;
+		uvc_function_connect(uvc);
+	}
+
+	return 0;
+}
+
+static void uvc_v4l2_disable(struct uvc_device *uvc)
+{
+	if (--uvc->connections)
+		return;
+
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
+	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
+		uvc_v4l2_disable(uvc);
+		handle->connected = false;
+	}
+
+	return 0;
 }
 
 static long
@@ -293,7 +333,6 @@ uvc_v4l2_open(struct file *file)
 	handle->device = &uvc->video;
 	file->private_data = &handle->vfh;
 
-	uvc_function_connect(uvc);
 	return 0;
 }
 
@@ -303,14 +342,11 @@ uvc_v4l2_release(struct file *file)
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
+	if (handle->connected)
+		uvc_v4l2_disable(uvc);
+	mutex_unlock(&uvc->video.mutex);
 
 	file->private_data = NULL;
 	v4l2_fh_del(&handle->vfh);
-- 
2.17.1

