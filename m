Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA67B2CAC4F
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 20:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731289AbgLAT2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 14:28:46 -0500
Received: from mail-db8eur05on2059.outbound.protection.outlook.com ([40.107.20.59]:16800
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730310AbgLAT2q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 14:28:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzrhe++w4IkhvUR/JsS872pRtXdWPfvi7C1lPuGDABxtmkZNUULhnxW748mwXfDHtDWlF5fZFMxhnvTWgojX8fHuibtzthOh79Zd3lzHvf7LVids5oDOBjauKoRiEXMnwn5RZ4vfjVd/iFTXY7XH14O2KH3XswZIcz4gnXyQ+Clg6TfwMhwxT47sWr6vds0r31fEXwYaF9hn1qmYs8WPPRGaQHmCeLmA6j17Bim/28CcSzNlBmOU5wjxA8fH8mIvEd/tdEuoDwd8vAhuyZNEGwWPoaCVPajilUCGIdPNbn/N/g103xElibZkmYbZ0KLcKLnJBlFSD5AvLUXg8Wl8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+eKxXU4/DbOY8L2n25Eg6K6/MbeI5FIVbd2He06uZo=;
 b=bqlAj9qSmUO+ui77TjcjyG9j6AMNorChVGkcXxBR+ltZdOrxLaGPPkW9dy1vFbaVC/Sfe9nB3NC4+c5U0HlTnlkUIc/vICgCpvlNWE1TqH0ZBM9H7Gyyciz/I2DUcwIaFrS6ARbZkeBeTNGfsMxqUNZLuNnbi0FK8VkU9q8E6nskR7o3g9PbqGVjsnhU7wpJyFP5YwPVTUqlFtUSDG6owiUuHcAbYzwvbnMysHzKu3ZxxrxRxKMsrXeWemltCzj73FUAh3tfk8GoWIKQdSBHF3B6Gr5lSzF3i75mP8rXdBXuAr2e8SObsHfIWakjJQ2PaXfQB6zfq90K5o7DW5bxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+eKxXU4/DbOY8L2n25Eg6K6/MbeI5FIVbd2He06uZo=;
 b=aQFd7t1NRHpCqWs9N6WBvRiAKo7TGB43ElGW9gKYYkZVN3kwWyfxBmirz6NxQbnr3VXbI+3e4nDHEpiyAQfHjACUxoJoyxHTKozE1mqF1A2rIc5kp596K/jm7snEfDuDm/c45T7ej1fDesFpAae0nclKPgqZguz7jCKQ+KkzmpY=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=wolfvision.net;
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com (2603:10a6:803:e5::10)
 by VI1PR08MB5390.eurprd08.prod.outlook.com (2603:10a6:803:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 19:27:55 +0000
Received: from VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30]) by VI1PR08MB4064.eurprd08.prod.outlook.com
 ([fe80::3cab:8098:fc6c:df30%4]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 19:27:54 +0000
From:   Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org, hverkuil@xs4all.nl,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org,
        Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Subject: [PATCH v4] usb: gadget: uvc: fix multiple opens
Date:   Tue,  1 Dec 2020 20:27:30 +0100
Message-Id: <20201201192730.5633-1-thomas.haemmerle@wolfvision.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2920c6ea-d191-a6cb-ec90-dda22bb9df55@wolfvision.net>
References: <2920c6ea-d191-a6cb-ec90-dda22bb9df55@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:8389:41c3:3c80:91a3:fff4:8381:98ab]
X-ClientProxiedBy: ZR0P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::11) To VI1PR08MB4064.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:8389:41c3:3c80:91a3:fff4:8381:98ab) by ZR0P278CA0024.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 19:27:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43d1e663-f978-4785-ccf3-08d8962f3381
X-MS-TrafficTypeDiagnostic: VI1PR08MB5390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB539065413E98C39A7AC2E9ACEDF40@VI1PR08MB5390.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYpXy2l5TnGgcq5HlFIQCx7c93dcy7bMC2000K6Zvm8fXGX8LrSIoPy/98nKHYxCtUB/IdZyTEns4OaZ1Jhh7ickycv6DG9Mx/O1YQHN2kd8vagRa1Skz1fNVvasmjUR3R4yn4OAR+T3xqIr8qJwt0CVolL0HtTXPSZa5Lamk3qVtlqMHFrgwwE5MKagbSJ+2pSoT+nFwHmG+gfK6WgdYXadBOC/oc/aq2tJBYJSvUntpouaPGaSRDtJ9UPG4Cz9J2+vWywNCW2lj8gsPndhjMtLvBniYXHLayHcR/0QohltpRWIW01vgm0PDidm0Ul4iEKzfsUNgzw8c1EL9dSFSLMTQ7niNUdVAGRZntBTRiZ/68Z70Qbkn27RQZHk0Yi9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4064.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39840400004)(44832011)(4326008)(2906002)(316002)(86362001)(6666004)(8936002)(36756003)(8676002)(1076003)(2616005)(478600001)(66556008)(66476007)(66946007)(5660300002)(107886003)(6512007)(52116002)(69590400008)(6486002)(186003)(6506007)(16526019)(6916009)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IYLZz9/fbnz+Othd2rZGGEUWYhPuuuC7ao0NFs3fd2ahALpLTPlUqY3tdNYi?=
 =?us-ascii?Q?ubV70zDg7zUSg3lL46YsU943b+ZYEjFNjAHYCCW0oGEr7PV3VrfRnm56rQVm?=
 =?us-ascii?Q?2tsxiorC3VliTNYYwEHp/5wL68yK1qy1XtYBryDX8FligcR398C9CKvCwwBg?=
 =?us-ascii?Q?GqfP5V2xmB4xhyxzTrcYQWZbfVHrkSKRq9MWkBXi9kQNp6OO/V34VYrDIvVh?=
 =?us-ascii?Q?CA3wWdNbR06hgAHog85H2SE9Iiyu756jAVtHxQNN1r+3yQq/gjLWOxvjbdu/?=
 =?us-ascii?Q?CoQAc60sWsepEo1B3Mr5+7wOVtUz13stOtFDkFUAZvDgaLk6x7GAA+ubuH7h?=
 =?us-ascii?Q?Lob2l97x62InwlFjtAsxiuVUk6eW2+gx/kKw8qukv9HsUcFPBTrkQFOUTEhv?=
 =?us-ascii?Q?McVlljiKJYmwqZEz4VOAZNDYlyUDx8iEQYph2tnGI19LnNc8tr4SZ3p6wBoJ?=
 =?us-ascii?Q?WRFJhp22pbp0xAXP8Vjol595J0sC2zRQpNN+/9y7A/8ChjAvbGwtcwQszQ0Y?=
 =?us-ascii?Q?MM/HnmA8UWCs2gUERASxmMxanBQoRcEEDOHjgPDMHKSdASpypQ4Kr0Yl30UV?=
 =?us-ascii?Q?2o35hZYxcQ8ffhpXQtXFlvR45ivwW80FHrWxP8yq9u3X0G8DMTlmIJsdGmMG?=
 =?us-ascii?Q?dG+9o3eg1wgAhfR4kZrzGgX4SvZ9eo8wnXBW1C+noS0hJ7GlWPbvuwsRaHui?=
 =?us-ascii?Q?KACSzTsD3419Kpa2frdsuDgtlu5cwyODloWKth0VvM71KAsjkepwSkVl14sB?=
 =?us-ascii?Q?W+Svaj1sQIcmEE2eS8OBbJ9WVO9v5l6jgFe2qp4cqpTasidRXhYIp7mdv4OS?=
 =?us-ascii?Q?X4ElVPlOuc6kxAImk9+QbQ6VjKkn3Q0MWEOoJsDqdIJZxVGbDkw85sgYHPBZ?=
 =?us-ascii?Q?6+5If5mnnj83D1yeh1so0nDzR3ls371PyiY0SBy2qYp7OU5rO0ahgzaa5GgL?=
 =?us-ascii?Q?PO6wBrSdiFhdSJFmNfqzTnTJ/5a+aaTOxt3Z3fb5c1D/uadAeK/LPdNSTw+M?=
 =?us-ascii?Q?hUgDdJQ5binvyNiaQR6w/rxXU3Rm49huXJWGoaUPJzBkXTFQC2EoYZJTzJBD?=
 =?us-ascii?Q?MVF+hSIq?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d1e663-f978-4785-ccf3-08d8962f3381
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4064.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 19:27:54.7527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGw5q0/1GeghrxhHRw6SV60TxEONcXtSYFBgCa8BPDN7/D1Y7b2gHnCJIZH7PkSreqFbJFAEkcOHQ83J7ZRgXbmU+dYy4/b0aCCOI6mKi5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5390
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
because there we can guarantee for a userspace application utilizing
UVC.
Block subscription on UVC_EVENT_SETUP while another application already
is subscribed to it, indicated by `bool func_connected` in
`struct uvc_device`.
Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
to tag it as the handle used by the userspace UVC application.

With this a process is able to check capabilities of the v4l2 device
without deactivating the function for the actual UVC application.

Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
---
v4:
  - remove unnecessary inner parentheses
  - keep and use the local video variable in `uvc_v4l2_release()`

v3:
  - replace `unsigned int connections` with `bool func_connected`
  - rename `bool connected` to `bool is_uvc_app_handle`

v2:
  - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
    locked in v4l2-core) introduced in v1
  - lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
    connected

 drivers/usb/gadget/function/uvc.h      |  2 ++
 drivers/usb/gadget/function/uvc_v4l2.c | 49 ++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 23ee25383c1f..893aaa70f81a 100644
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
index 4ca89eab6159..197c26f7aec6 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -227,17 +227,55 @@ static int
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
+	if (sub->type == UVC_EVENT_SETUP && uvc->func_connected)
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
+	if (sub->type == UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
+		uvc_v4l2_disable(uvc);
+		handle->is_uvc_app_handle = false;
+	}
+
+	return 0;
 }
 
 static long
@@ -292,7 +330,6 @@ uvc_v4l2_open(struct file *file)
 	handle->device = &uvc->video;
 	file->private_data = &handle->vfh;
 
-	uvc_function_connect(uvc);
 	return 0;
 }
 
@@ -304,11 +341,9 @@ uvc_v4l2_release(struct file *file)
 	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
 	struct uvc_video *video = handle->device;
 
-	uvc_function_disconnect(uvc);
-
 	mutex_lock(&video->mutex);
-	uvcg_video_enable(video, 0);
-	uvcg_free_buffers(&video->queue);
+	if (handle->is_uvc_app_handle)
+		uvc_v4l2_disable(uvc);
 	mutex_unlock(&video->mutex);
 
 	file->private_data = NULL;
-- 
2.25.1

