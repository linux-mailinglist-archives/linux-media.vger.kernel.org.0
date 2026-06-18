Return-Path: <linux-media+bounces-65152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wSnMGX6YM2rhDwYAu9opvQ
	(envelope-from <linux-media+bounces-65152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:04:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A785769DF86
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:04:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TUUNRm8j;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65152-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65152-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17BC7300CE75
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 07:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AF03B8BB6;
	Thu, 18 Jun 2026 07:03:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85B3624CE
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 07:03:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781766228; cv=none; b=Z21kNWQMRplrhOyOGUmGJmezSd7pZs1rNF7nUh9Z+VEPsOLH40wSZ5Kib1FUCA4Gf9o8twpxep6ys6soQ4Di7z8Pk+Xca0iPpGyllSHxJedMmfWyMjs4tFbv2zYwJO482X97GboQ6OS717kb2x7feRofADBu3Ox/c3LMoQJmz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781766228; c=relaxed/simple;
	bh=JEynrxXvjURfywDkuMFx9Dty3iubDY/Q2/J7bg5yu9Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fkGiLft/aUevz4Q3NoVaecqyw1NfMnTPvx+2R5xBzfIkhIRr+YSAqgjMYNhg2rxhzLqQ+5RQaPwk5lAChwA3DqaVtT/ode2fObqB5n7utaaFraX7+Bh2LD3e1ua3zl25NLKQiTPi8N/rJKQRHc6QkT/zGvBJM+XXryvQVIid5tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUUNRm8j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAF61F000E9;
	Thu, 18 Jun 2026 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781766227;
	bh=/LDoUHHISJn2o99apUc0ggpp+8KYH5jWp0hhR+NuzTM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TUUNRm8jTvk9jW+LYTvX9HOZm4E888p4UtszZMRK0oST+RCn19h7A7XhDJq3ezfg4
	 5LS4X9vkEUExfR+jiU2zXuWAJtR2uOpqZoo/jz0boMndY0NtG6xU2N8CEFWH27+f4g
	 G785MMlOMohtYbFRhBuYDlZ7iuBI3SijbvoN/Tvo7dDK9SpTObicKy0f1HLCnzB1cZ
	 ZSC+Vm3Ui7dU1JWUVJtCUmR8FeTNc0EmloR3mlRuLWyqlpNwy2AkCZhaGgjvhHLehE
	 EKk23y0DONn+TJLfENLyr8qpVArJyg/fmcqDa1mOI6d8OssE3IRhPfVCnvLFMqWAJ4
	 x5ieTL4dfDffQ==
Message-ID: <160a57b9-9c06-43de-bab9-9e3d05656b1f@kernel.org>
Date: Thu, 18 Jun 2026 09:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: v4l2-compliance does not pick media device with -z and -u options
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <20260610113356.GB1209951@killaraus.ideasonboard.com>
 <d2625a27-bd99-4a87-98cb-346b6271380c@kernel.org>
 <20260612151610.GA2074789@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260612151610.GA2074789@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65152-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A785769DF86

Hi Laurent,

Here is a second attempt to fix this. Let me know if it works!

The reason is it so messy is that support for the media device and
media bus info was added much later, and it really needs a cleanup.

Anyway, fingers crossed...

Regards,

	Hans

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 95e4c74f..6d6d7904 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -216,7 +216,7 @@ std::string mi_get_devpath_from_dev_t(dev_t dev)
 	return devpath;
 }

-int mi_get_media_fd(int fd, const char *bus_info)
+int mi_get_media_fd(int fd)
 {
 	int media_fd = -1;
 	dev_t dev;
@@ -243,9 +243,39 @@ int mi_get_media_fd(int fd, const char *bus_info)
 			devname += ep->d_name;
 			media_fd = open(devname.c_str(), O_RDWR);

-			if (bus_info &&
-			    (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
-			     strcmp(mdinfo.bus_info, bus_info))) {
+			if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo)) {
+				close(media_fd);
+				continue;
+			}
+			break;
+		}
+	}
+	closedir(dp);
+	return media_fd;
+}
+
+int mi_get_media_bus_info(const char *bus_info)
+{
+	int media_fd = -1;
+	DIR *dp;
+	struct dirent *ep;
+
+	if (!bus_info)
+		return -1;
+
+	dp = opendir("/dev");
+	if (dp == nullptr)
+		return -1;
+	while ((ep = readdir(dp))) {
+		if (!memcmp(ep->d_name, "media", 5) && isdigit(ep->d_name[5])) {
+			struct media_device_info mdinfo;
+			std::string devname("/dev/");
+
+			devname += ep->d_name;
+			media_fd = open(devname.c_str(), O_RDWR);
+
+			if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
+			    strcmp(mdinfo.bus_info, bus_info)) {
 				close(media_fd);
 				continue;
 			}
diff --git a/utils/common/media-info.h b/utils/common/media-info.h
index c0dd6304..75eb29b4 100644
--- a/utils/common/media-info.h
+++ b/utils/common/media-info.h
@@ -51,12 +51,15 @@ std::string mi_get_devpath_from_dev_t(dev_t dev);

 /*
  * For a given device fd return the corresponding media device
- * or -1 if there is none.
- *
- * If bus_info is not NULL, then find the media device that
- * matches the given bus_info.
+ * or -1 if there is none. This only works if the media device
+ * is discoverable from where fd sits in /sys.
  */
-int mi_get_media_fd(int fd, const char *bus_info = NULL);
+int mi_get_media_fd(int fd);
+
+/*
+ * Find the media device that matches the given bus_info.
+ */
+int mi_get_media_bus_info(const char *bus_info);

 /* Return entity flags description */
 std::string mi_entflags2s(__u32 flags);
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4e5c9d00..a04e4e84 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1007,7 +1007,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		if (parent_media_fd >= 0)
 			media_fd = parent_media_fd;
 		else
-			media_fd = mi_get_media_fd(node.g_fd(), node.bus_info);
+			media_fd = mi_get_media_bus_info(node.bus_info);
 	}

 	int fd = node.is_media() ? node.g_fd() : media_fd;
@@ -1658,6 +1658,7 @@ int main(int argc, char **argv)
 	media_type type = MEDIA_TYPE_UNKNOWN;
 	struct node expbuf_node;
 	std::string media_bus_info;
+	int media_fd = -1;
 	const char *env_media_apps_color = getenv("MEDIA_APPS_COLOR");

 	/* command args */
@@ -1903,6 +1904,16 @@ int main(int argc, char **argv)
 			strerror(errno));
 		std::exit(EXIT_FAILURE);
 	}
+	if (type != MEDIA_TYPE_MEDIA && !media_bus_info.empty()) {
+		std::string media_devname;
+
+		media_fd = open_media_bus_info(media_bus_info, media_devname);
+		if (media_fd < 0) {
+			fprintf(stderr, "Failed to find media device for %s: %s\n",
+				media_bus_info.c_str(), strerror(errno));
+			std::exit(EXIT_FAILURE);
+		}
+	}

 	if (!expbuf_device.empty()) {
 		expbuf_node.s_trace(options[OptTrace]);
@@ -1915,7 +1926,7 @@ int main(int argc, char **argv)
 		}
 	}

-	testNode(node, node, expbuf_node, type, frame_count, all_fmt_frame_count);
+	testNode(node, node, expbuf_node, type, frame_count, all_fmt_frame_count, media_fd);

 	if (!expbuf_device.empty())
 		expbuf_node.close();
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 7e08668b..233cf03f 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -2296,7 +2296,7 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
 int testRequests(struct node *node, bool test_streaming)
 {
 	filehandles fhs;
-	int media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
+	int media_fd = fhs.add(mi_get_media_bus_info(node->bus_info));
 	int req_fd;
 	struct test_query_ext_ctrl valid_qctrl;
 	v4l2_ext_controls ctrls;
@@ -2432,7 +2432,7 @@ int testRequests(struct node *node, bool test_streaming)
 	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr) != EBADF);

 	// Open media_fd and alloc a request again
-	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
+	media_fd = fhs.add(mi_get_media_bus_info(node->bus_info));
 	fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd));
 	fhs.add(req_fd);
 	ctrls.count = 1;
@@ -2507,7 +2507,7 @@ int testRequests(struct node *node, bool test_streaming)
 	unsigned num_requests = 2 * num_bufs;
 	last_seq.init();

-	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
+	media_fd = fhs.add(mi_get_media_bus_info(node->bus_info));

 	// Allocate the requests
 	for (unsigned i = 0; i < num_requests; i++) {
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 517fc7f2..fe5d0dfe 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -1346,10 +1346,10 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
 		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
 			struct v4l2_capability vcap = {};
 			fd.querycap(vcap);
-			int media_fd = mi_get_media_fd(fd.g_fd(), (const char *)vcap.bus_info);
+			int media_fd = mi_get_media_bus_info((const char *)vcap.bus_info);

 			if (media_fd < 0) {
-				fprintf(stderr, "%s: mi_get_media_fd failed\n", __func__);
+				fprintf(stderr, "%s: mi_get_media_bus_info failed\n", __func__);
 				return media_fd;
 			}

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 842e22fd..14f5c51f 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1382,7 +1382,10 @@ int main(int argc, char **argv)
 			capabilities = vcap.device_caps;
 	}

-	media_fd = mi_get_media_fd(fd, is_subdev ? 0 : (const char *)vcap.bus_info);
+	if (is_subdev)
+		media_fd = mi_get_media_fd(fd);
+	else
+		media_fd = mi_get_media_bus_info((const char *)vcap.bus_info);

 	priv_magic = (capabilities & V4L2_CAP_EXT_PIX_FORMAT) ?
 			V4L2_PIX_FMT_PRIV_MAGIC : 0;


