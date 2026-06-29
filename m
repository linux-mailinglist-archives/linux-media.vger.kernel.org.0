Return-Path: <linux-media+bounces-65946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SPlfDRN5Qmoz8AkAu9opvQ
	(envelope-from <linux-media+bounces-65946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:54:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02C6DB945
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="ZaElcNP/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65946-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65946-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1902307BB0F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B63405860;
	Mon, 29 Jun 2026 13:16:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C5404BFA
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 13:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738961; cv=none; b=mTjNlOjvLACe36jKlEGK9+oxqClD8sdM2xiM4VpD47x8IbJmc6XU4xCNpsLqpHx/4I/ChpvC1QUblntJFpJiUhgPIo+wGmz2KOse8vsny4XxmOYxnifxslsHxcMkn1POS8pUyEDsHzssRWyUr5yG6VEHR6uLN4dKVMPCQZ0QfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738961; c=relaxed/simple;
	bh=uhr9hCUSL6wmI9veDjiilFC30fmtKbhG80m5B2BCrHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b664XhoM/znPjxrQwI0hWuEWuJkopCWr7HMhzyjkkaZ4UC3QLnTXpnJYmQqnZf5SR3cNLwbIUR+LuKz6QLofQe/zYVcWZnt7PlOiFD+TkfV53M2TEa6pmTknOjSfBlkojTCskjm6fqN9uJl+cd1s/E000/l9yXikflXgj4N/CHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZaElcNP/; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C59B324;
	Mon, 29 Jun 2026 15:15:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782738914;
	bh=uhr9hCUSL6wmI9veDjiilFC30fmtKbhG80m5B2BCrHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaElcNP/EpEXf9ZDSX7WWwvwwRTN3m7YclrjGzbcosl9iHk/DNA5O29tezFYZS0dw
	 TgP6DhzPK1EKmVPPrdvRrLz032KeIoQsKbrW18RTJtbIRaoB1HKNSPcD5UCHHtzRq/
	 FD6CeHDsavAPGmcSfH4qk0Zk+JfN8GIs6/4Say7A=
Date: Mon, 29 Jun 2026 16:15:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: v4l2-compliance does not pick media device with -z and -u options
Message-ID: <20260629131555.GF3054459@killaraus.ideasonboard.com>
References: <20260610113356.GB1209951@killaraus.ideasonboard.com>
 <d2625a27-bd99-4a87-98cb-346b6271380c@kernel.org>
 <20260612151610.GA2074789@killaraus.ideasonboard.com>
 <160a57b9-9c06-43de-bab9-9e3d05656b1f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160a57b9-9c06-43de-bab9-9e3d05656b1f@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65946-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B02C6DB945

Hi Hans,

On Thu, Jun 18, 2026 at 09:03:44AM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> Here is a second attempt to fix this. Let me know if it works!
> 
> The reason is it so messy is that support for the media device and
> media bus info was added much later, and it really needs a cleanup.

I can't disagree :-) There are lots of opportunities to refactor the
code into classes with clear APIs.

> Anyway, fingers crossed...

It works better \o/

----------------------------------------
root@buildroot ~ # v4l2-compliance -z "platform:rkisp1" -u "imx219 1-0010"
v4l2-compliance 1.33.0-5476, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1355f143676b 2026-06-18 06:31:21

Compliance test for rkisp1 device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 7.1.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
        Driver name      : rkisp1
        Model            : rkisp1
        Serial           :
        Bus info         : platform:rkisp1
        Media version    : 7.1.0
        Hardware revision: 0x0000000e (14)
        Driver version   : 7.1.0
Interface Info:
        ID               : 0x0300002c
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000022 (34)
        Name             : imx219 1-0010
        Function         : Camera Sensor
        Pad 0x01000023   : 0: Source
          Link 0x02000024: to remote pad 0x100001e of entity 'csis-32e40000.csi' (Video Interface Bridge): Data

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Source Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
                warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
                warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 20 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for rkisp1 device /dev/v4l-subdev3: 54, Succeeded: 54, Failed: 0, Warnings: 2
----------------------------------------

I think we should skip quite a few of the bove tests for subdevs (the
"Format ioctls" and "Buffer ioctls" tests for instance), but that's a
separate issue.

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
> index 95e4c74f..6d6d7904 100644
> --- a/utils/common/media-info.cpp
> +++ b/utils/common/media-info.cpp
> @@ -216,7 +216,7 @@ std::string mi_get_devpath_from_dev_t(dev_t dev)
>  	return devpath;
>  }
> 
> -int mi_get_media_fd(int fd, const char *bus_info)
> +int mi_get_media_fd(int fd)
>  {
>  	int media_fd = -1;
>  	dev_t dev;
> @@ -243,9 +243,39 @@ int mi_get_media_fd(int fd, const char *bus_info)
>  			devname += ep->d_name;
>  			media_fd = open(devname.c_str(), O_RDWR);
> 
> -			if (bus_info &&
> -			    (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
> -			     strcmp(mdinfo.bus_info, bus_info))) {
> +			if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo)) {
> +				close(media_fd);
> +				continue;
> +			}
> +			break;
> +		}
> +	}
> +	closedir(dp);
> +	return media_fd;
> +}
> +
> +int mi_get_media_bus_info(const char *bus_info)
> +{
> +	int media_fd = -1;
> +	DIR *dp;
> +	struct dirent *ep;
> +
> +	if (!bus_info)
> +		return -1;
> +
> +	dp = opendir("/dev");
> +	if (dp == nullptr)
> +		return -1;
> +	while ((ep = readdir(dp))) {
> +		if (!memcmp(ep->d_name, "media", 5) && isdigit(ep->d_name[5])) {
> +			struct media_device_info mdinfo;
> +			std::string devname("/dev/");
> +
> +			devname += ep->d_name;
> +			media_fd = open(devname.c_str(), O_RDWR);
> +
> +			if (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
> +			    strcmp(mdinfo.bus_info, bus_info)) {
>  				close(media_fd);
>  				continue;
>  			}
> diff --git a/utils/common/media-info.h b/utils/common/media-info.h
> index c0dd6304..75eb29b4 100644
> --- a/utils/common/media-info.h
> +++ b/utils/common/media-info.h
> @@ -51,12 +51,15 @@ std::string mi_get_devpath_from_dev_t(dev_t dev);
> 
>  /*
>   * For a given device fd return the corresponding media device
> - * or -1 if there is none.
> - *
> - * If bus_info is not NULL, then find the media device that
> - * matches the given bus_info.
> + * or -1 if there is none. This only works if the media device
> + * is discoverable from where fd sits in /sys.
>   */
> -int mi_get_media_fd(int fd, const char *bus_info = NULL);
> +int mi_get_media_fd(int fd);
> +
> +/*
> + * Find the media device that matches the given bus_info.
> + */
> +int mi_get_media_bus_info(const char *bus_info);
> 
>  /* Return entity flags description */
>  std::string mi_entflags2s(__u32 flags);
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 4e5c9d00..a04e4e84 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1007,7 +1007,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		if (parent_media_fd >= 0)
>  			media_fd = parent_media_fd;
>  		else
> -			media_fd = mi_get_media_fd(node.g_fd(), node.bus_info);
> +			media_fd = mi_get_media_bus_info(node.bus_info);
>  	}
> 
>  	int fd = node.is_media() ? node.g_fd() : media_fd;
> @@ -1658,6 +1658,7 @@ int main(int argc, char **argv)
>  	media_type type = MEDIA_TYPE_UNKNOWN;
>  	struct node expbuf_node;
>  	std::string media_bus_info;
> +	int media_fd = -1;
>  	const char *env_media_apps_color = getenv("MEDIA_APPS_COLOR");
> 
>  	/* command args */
> @@ -1903,6 +1904,16 @@ int main(int argc, char **argv)
>  			strerror(errno));
>  		std::exit(EXIT_FAILURE);
>  	}
> +	if (type != MEDIA_TYPE_MEDIA && !media_bus_info.empty()) {
> +		std::string media_devname;
> +
> +		media_fd = open_media_bus_info(media_bus_info, media_devname);
> +		if (media_fd < 0) {
> +			fprintf(stderr, "Failed to find media device for %s: %s\n",
> +				media_bus_info.c_str(), strerror(errno));
> +			std::exit(EXIT_FAILURE);
> +		}
> +	}
> 
>  	if (!expbuf_device.empty()) {
>  		expbuf_node.s_trace(options[OptTrace]);
> @@ -1915,7 +1926,7 @@ int main(int argc, char **argv)
>  		}
>  	}
> 
> -	testNode(node, node, expbuf_node, type, frame_count, all_fmt_frame_count);
> +	testNode(node, node, expbuf_node, type, frame_count, all_fmt_frame_count, media_fd);
> 
>  	if (!expbuf_device.empty())
>  		expbuf_node.close();
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 7e08668b..233cf03f 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -2296,7 +2296,7 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
>  int testRequests(struct node *node, bool test_streaming)
>  {
>  	filehandles fhs;
> -	int media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
> +	int media_fd = fhs.add(mi_get_media_bus_info(node->bus_info));
>  	int req_fd;
>  	struct test_query_ext_ctrl valid_qctrl;
>  	v4l2_ext_controls ctrls;
> @@ -2432,7 +2432,7 @@ int testRequests(struct node *node, bool test_streaming)
>  	fail_on_test(doioctl_fd(req_fd, MEDIA_REQUEST_IOC_REINIT, nullptr) != EBADF);
> 
>  	// Open media_fd and alloc a request again
> -	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
> +	media_fd = fhs.add(mi_get_media_bus_info(node->bus_info));
>  	fail_on_test(doioctl_fd(media_fd, MEDIA_IOC_REQUEST_ALLOC, &req_fd));
>  	fhs.add(req_fd);
>  	ctrls.count = 1;
> @@ -2507,7 +2507,7 @@ int testRequests(struct node *node, bool test_streaming)
>  	unsigned num_requests = 2 * num_bufs;
>  	last_seq.init();
> 
> -	media_fd = fhs.add(mi_get_media_fd(node->g_fd(), node->bus_info));
> +	media_fd = fhs.add(mi_get_media_bus_info(node->bus_info));
> 
>  	// Allocate the requests
>  	for (unsigned i = 0; i < num_requests; i++) {
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 517fc7f2..fe5d0dfe 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -1346,10 +1346,10 @@ static int do_setup_out_buffers(cv4l_fd &fd, cv4l_queue &q, FILE *fin, bool qbuf
>  		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS) {
>  			struct v4l2_capability vcap = {};
>  			fd.querycap(vcap);
> -			int media_fd = mi_get_media_fd(fd.g_fd(), (const char *)vcap.bus_info);
> +			int media_fd = mi_get_media_bus_info((const char *)vcap.bus_info);
> 
>  			if (media_fd < 0) {
> -				fprintf(stderr, "%s: mi_get_media_fd failed\n", __func__);
> +				fprintf(stderr, "%s: mi_get_media_bus_info failed\n", __func__);
>  				return media_fd;
>  			}
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index 842e22fd..14f5c51f 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -1382,7 +1382,10 @@ int main(int argc, char **argv)
>  			capabilities = vcap.device_caps;
>  	}
> 
> -	media_fd = mi_get_media_fd(fd, is_subdev ? 0 : (const char *)vcap.bus_info);
> +	if (is_subdev)
> +		media_fd = mi_get_media_fd(fd);

This won't work correctly on subdevs that are not direct children of the
device registering the media device, but it's fine, it's not a
regression. media_fd is only used to print the media info anyway, it
won't prevent anything else from working.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	else
> +		media_fd = mi_get_media_bus_info((const char *)vcap.bus_info);
> 
>  	priv_magic = (capabilities & V4L2_CAP_EXT_PIX_FORMAT) ?
>  			V4L2_PIX_FMT_PRIV_MAGIC : 0;
> 

-- 
Regards,

Laurent Pinchart

