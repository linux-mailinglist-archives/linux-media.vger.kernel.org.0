Return-Path: <linux-media+bounces-64685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SQECJZzvK2o3IAQAu9opvQ
	(envelope-from <linux-media+bounces-64685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:38:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D76667901D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:38:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T7apzgkC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64685-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64685-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 074BD312C157
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2F635E1B1;
	Fri, 12 Jun 2026 11:37:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C413C3453
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 11:37:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264276; cv=none; b=shDZWT1uhj1rkbL/rIUxNZeh0Dup4KCuN+cmoVF7nnadwy4mfYCOHtaqDgVTWhsrAi3j8CpzLIF8bFt0R9t4juqappNqx0VsUGpWJussNUziIqJr5AuNy8rMmGbpBeGzMuzZJ0CUcTrvAOLqH68d7GL/ieL6zpJ3sNxK4of7CSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264276; c=relaxed/simple;
	bh=PZCl27017VY1qWpiP3I0Jl3e/8Vt/Zd8Ko6z+Ss2NPU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t6xJ9eh1+8PJQ6hflSydK+E+CFakrYD45BfuoBJFqGr96KalCXY2BNuMehlXuDJtKlJkCd5A2BL3oVDRUDCspTAvRYZBEdRE9kJpR4VCtrStok6XXH2dDN5lEzWDEMATC9sLF/B5/tfF/mdVPNmwL5/Cx9Dn3Uc8SSpDVTzeLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7apzgkC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B3A1F000E9;
	Fri, 12 Jun 2026 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781264271;
	bh=55PDwAtiI9SduVNca06sT6NuqakeVX8A7JRyDMMQpV0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=T7apzgkCmfHCMM/tE2FDTuaKsyhewDbfBTbHtA8X1SnSsmcotpOdbUFvAOeXpiRDC
	 MXoFmVvLFovH+gUoaZYaDyMYtCwhxTZK4QqlHFZxBDYQtnQWSTDA0YV8TPZ6wxwyeL
	 wPRDKM+C7CnUOUsb9CBzs/awRfzkGsafigiTh+DKzP4KhgTaWXw8EnogCFOWSRpo7s
	 FCICKjoEjJwXWNERrTsaExqhFv+d5ZSofXOjVug111IkQZtpq0sNmZzZdmzOwD4IvB
	 9R5mX42EWAyDAEf5pXsc9mL3xiGJk1CKcL7/Q6QSaggLzelW2UEvGhV9E2hJovU1qC
	 zDRRcH5rnLrSA==
Message-ID: <d2625a27-bd99-4a87-98cb-346b6271380c@kernel.org>
Date: Fri, 12 Jun 2026 13:37:49 +0200
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
Content-Language: en-US, nl
In-Reply-To: <20260610113356.GB1209951@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-64685-lists,linux-media=lfdr.de,cisco];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D76667901D

On 10/06/2026 13:33, Laurent Pinchart wrote:
> Hi Hans,
> 
> I've noticed yesterday that v4l2-compliance does not pick a media device
> when run on a subdev with the -z and -u options.
> 
> The options are documented as
> 
>   -u, --subdev-device <dev>
>                      Use device <dev> as the v4l-subdev device.
>                      If <dev> starts with a digit, then /dev/v4l-subdev<dev> is used.
>                      [...]
>                      Otherwise if -z was specified earlier, then <dev> is the entity name
>                      or interface ID (if prefixed with 0x) as found in the topology of the
>                      media device with the bus info string as specified by the -z option.
> 
>   -z, --media-bus-info <bus-info>
>                      Find the media device with the given bus info string. If set, then
>                      the options above can use the entity name or interface ID to refer
>                      to the device nodes.
> 
> 
> I reproduced the issue on an i.MX8MP and a Raspberry Pi 5. On i.MX8MP, I
> ran
> 
> $ v4l2-compliance -z "platform:rkisp1" -u "imx219 1-0010"
> 
> where "imx219 1-0010" is the sensor entity in the ISP media graph. This
> resulted in the following output:
> 
> --------
> v4l2-compliance 1.33.0-5474, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 73e05fa3c79b 2026-06-02 06:15:45
> 
> Compliance test for device /dev/v4l-subdev3:
> 
> Driver Info:
>         Driver version   : 7.1.0
>         Capabilities     : 0x00000000
>         Client Capabilities: 0x0000000000000003
> streams interval-uses-which media_fd 4294967295 ent_id 0x00000000
> 
> Required ioctls:
>         test VIDIOC_SUDBEV_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/v4l-subdev3 open: OK
>         test VIDIOC_SUBDEV_QUERYCAP: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 20 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
>         test blocking wait: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0
> --------
> 
> v4l2-compliance skipped pad-based ioctl tests, because it was unable to
> count the number of pad of the entity. The root cause if
> mi_get_media_fd() returning -1 in testNode(), because
> /sys/dev/char/81:9/device/ does not contain any entry whose name starts
> with "media".
> 
> I couldn't reproduce the issue with vimc running
> 
> $ v4l2-compliance -z platform:vimc.0 -u "Sensor A"
> 
> so I investigated further, and realized there's a major difference: the
> "Sensor A" entity in vimc is created by the vimc driver that registers
> the media device, while the sensor entity in the rkisp1 media graph is
> created by a sensor driver.
> 
> Finding the media device through sysfs isn't guaranteed to work. We can
> keep doing so as a last resort option when no -z option is specified,
> but we should use the media device found by open_media_bus_info() when
> running with -z.
> 

Please check this patch, I hope this fixes the issue.

Regards,

	Hans

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 95e4c74f..b9140727 100644
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
@@ -243,6 +243,34 @@ int mi_get_media_fd(int fd, const char *bus_info)
 			devname += ep->d_name;
 			media_fd = open(devname.c_str(), O_RDWR);

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
+
+	DIR *dp;
+	struct dirent *ep;
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
 			if (bus_info &&
 			    (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
 			     strcmp(mdinfo.bus_info, bus_info))) {
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
index 4e5c9d00..0108c8d4 100644
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


