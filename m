Return-Path: <linux-media+bounces-64705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K7KzHA4jLGo0MAQAu9opvQ
	(envelope-from <linux-media+bounces-64705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:17:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1E67A774
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=t7amtV0j;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64705-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64705-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07B9D31D0CED
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51BE2D5926;
	Fri, 12 Jun 2026 15:16:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191CB25B083
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 15:16:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277376; cv=none; b=Ufj6zeIP3lgFyoxKDhCLaNTpKWE9++EY1Md62h9q6Ws5Gw2i0pgAyn2YPPeUEHvR1UT3dy8eo+u6JQrIkmkbf1KTyF1r6L3zh9c48Kbh7t3dOmt4nHL9NAdeI/1GnA1mkiMiemS2IE7XA9bipUdrvLGPDNngmTgIYKGaWGFGK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277376; c=relaxed/simple;
	bh=yvQJEqT32vjMcbPqu8nC8A8RqKJNlR/b2XRMRQx+RE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFrGGe6cIBaC8dZ9P0ypbcS3s9nVDbn7G+TM02wxJGTmBr0aMKtyCr6kI1DLqc2DXASaLPTXDDEUuPTD9r0BUaexe/jnTnll0QbB+Twiok6whEiadldpmqZEmge30OR31CtoZjbXBHmp4M0+c/yFvQ7wCK+CO48hrMasiE51FeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t7amtV0j; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E48C1337;
	Fri, 12 Jun 2026 17:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781277341;
	bh=yvQJEqT32vjMcbPqu8nC8A8RqKJNlR/b2XRMRQx+RE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7amtV0jFWRsVei5mWnuqiYtzk7lKUoZglS5CKPNMN51laLT9BzpRB6IeMBvEU6kj
	 v9ArBmyl001eWaAEC9U3cWl8wYtjIt200BuT0EYBpnOokBBoYORnmxi7X0QfOJiMzO
	 BWNmYV2WLcTMML1Osv2exC9R6gVAbfZwQCksNit8=
Date: Fri, 12 Jun 2026 18:16:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: v4l2-compliance does not pick media device with -z and -u options
Message-ID: <20260612151610.GA2074789@killaraus.ideasonboard.com>
References: <20260610113356.GB1209951@killaraus.ideasonboard.com>
 <d2625a27-bd99-4a87-98cb-346b6271380c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2625a27-bd99-4a87-98cb-346b6271380c@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-64705-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D1E67A774

Hi Hans,

On Fri, Jun 12, 2026 at 01:37:49PM +0200, Hans Verkuil wrote:
> On 10/06/2026 13:33, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > I've noticed yesterday that v4l2-compliance does not pick a media device
> > when run on a subdev with the -z and -u options.
> > 
> > The options are documented as
> > 
> >   -u, --subdev-device <dev>
> >                      Use device <dev> as the v4l-subdev device.
> >                      If <dev> starts with a digit, then /dev/v4l-subdev<dev> is used.
> >                      [...]
> >                      Otherwise if -z was specified earlier, then <dev> is the entity name
> >                      or interface ID (if prefixed with 0x) as found in the topology of the
> >                      media device with the bus info string as specified by the -z option.
> > 
> >   -z, --media-bus-info <bus-info>
> >                      Find the media device with the given bus info string. If set, then
> >                      the options above can use the entity name or interface ID to refer
> >                      to the device nodes.
> > 
> > 
> > I reproduced the issue on an i.MX8MP and a Raspberry Pi 5. On i.MX8MP, I
> > ran
> > 
> > $ v4l2-compliance -z "platform:rkisp1" -u "imx219 1-0010"
> > 
> > where "imx219 1-0010" is the sensor entity in the ISP media graph. This
> > resulted in the following output:
> > 
> > --------
> > v4l2-compliance 1.33.0-5474, 64 bits, 64-bit time_t
> > v4l2-compliance SHA: 73e05fa3c79b 2026-06-02 06:15:45
> > 
> > Compliance test for device /dev/v4l-subdev3:
> > 
> > Driver Info:
> >         Driver version   : 7.1.0
> >         Capabilities     : 0x00000000
> >         Client Capabilities: 0x0000000000000003
> > streams interval-uses-which media_fd 4294967295 ent_id 0x00000000
> > 
> > Required ioctls:
> >         test VIDIOC_SUDBEV_QUERYCAP: OK
> >         test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> >         test second /dev/v4l-subdev3 open: OK
> >         test VIDIOC_SUBDEV_QUERYCAP: OK
> >         test for unlimited opens: OK
> > 
> > Debug ioctls:
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 20 Private Controls: 0
> > 
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK (Not Supported)
> >         test VIDIOC_TRY_FMT: OK (Not Supported)
> >         test VIDIOC_S_FMT: OK (Not Supported)
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> >         test CREATE_BUFS maximum buffers: OK
> >         test VIDIOC_REMOVE_BUFS: OK
> >         test VIDIOC_EXPBUF: OK (Not Supported)
> >         test Requests: OK (Not Supported)
> >         test blocking wait: OK (Not Supported)
> > 
> > Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0
> > --------
> > 
> > v4l2-compliance skipped pad-based ioctl tests, because it was unable to
> > count the number of pad of the entity. The root cause if
> > mi_get_media_fd() returning -1 in testNode(), because
> > /sys/dev/char/81:9/device/ does not contain any entry whose name starts
> > with "media".
> > 
> > I couldn't reproduce the issue with vimc running
> > 
> > $ v4l2-compliance -z platform:vimc.0 -u "Sensor A"
> > 
> > so I investigated further, and realized there's a major difference: the
> > "Sensor A" entity in vimc is created by the vimc driver that registers
> > the media device, while the sensor entity in the rkisp1 media graph is
> > created by a sensor driver.
> > 
> > Finding the media device through sysfs isn't guaranteed to work. We can
> > keep doing so as a last resort option when no -z option is specified,
> > but we should use the media device found by open_media_bus_info() when
> > running with -z.
> 
> Please check this patch, I hope this fixes the issue.

Unfortunately it doesn't. Please read below for comments.

> diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
> index 95e4c74f..b9140727 100644
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
> @@ -243,6 +243,34 @@ int mi_get_media_fd(int fd, const char *bus_info)
>  			devname += ep->d_name;
>  			media_fd = open(devname.c_str(), O_RDWR);
> 
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

Small improvement, you can return -1 here if bus_info is NULL.

> +	int media_fd = -1;
> +
> +	DIR *dp;
> +	struct dirent *ep;
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
>  			if (bus_info &&

And drop the bus_info check here.

>  			    (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
>  			     strcmp(mdinfo.bus_info, bus_info))) {
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
> index 4e5c9d00..0108c8d4 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1007,7 +1007,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  		if (parent_media_fd >= 0)
>  			media_fd = parent_media_fd;
>  		else
> -			media_fd = mi_get_media_fd(node.g_fd(), node.bus_info);
> +			media_fd = mi_get_media_bus_info(node.bus_info);

This doesn't work, because node.bus_info is never set.

The node class has a bus_info field and a media_bus_info field. As
they're not documented, I'm not sure which one is supposed to be set
here. node.media_bus_info is set later in this function, retrieved from
the media_fd.

I'd fix this myself (I don't think it's a very difficult job), but all
this is lots of spaghetti code and I don't know how it's supposed to
look like :-/

>  	}
> 
>  	int fd = node.is_media() ? node.g_fd() : media_fd;
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
> +	else
> +		media_fd = mi_get_media_bus_info((const char *)vcap.bus_info);
> 
>  	priv_magic = (capabilities & V4L2_CAP_EXT_PIX_FORMAT) ?
>  			V4L2_PIX_FMT_PRIV_MAGIC : 0;
> 

-- 
Regards,

Laurent Pinchart

