Return-Path: <linux-media+bounces-50752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EF5D22CA8
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 061BD3065806
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16F0326D43;
	Thu, 15 Jan 2026 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="T8LQYv4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D5E242D6A
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461703; cv=none; b=QlZbH4lzWCK2zc+g//BhNXbJonbJcYf15G58O8E0+oSyFjwTWwvZSFWvlHWUzHcnFM6Tfzg94kuI8iBSCHik95FpyfK8r9+lXPsd2iDeB35Gtk7ga3w7brDwvehwR+CQM2Zx+WQrMlVRqrP3yzbrKIxDHB3igami7I+IHVALiCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461703; c=relaxed/simple;
	bh=6aTdJNxflg1aFlJhuvm647w/vu9EvC1DlAYf3yW+XAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH3cmL5t1qYQsq39kjwyZqAgIqhzLtbBW2wQ6MKy51oMb43pMWAmCWA82oMsTX/1GeUuHj7Z80RiptTy3KH85hm2PWFyEUANl44m3AHuGjTP/0E1+83PWX6Iz61iuH8RxWGim1E4GbXlWInwLHhSl15cExoBaslr3nCS0fxhIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=T8LQYv4Z; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b19939070fso1444125eec.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 23:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1768461701; x=1769066501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8h9J5PiwGjRDi4lgWh6a9pAocUe6myz99QYAZpJqDU=;
        b=T8LQYv4ZaoBS+JB6Y4ZwUOda3wExGYakRn7YTyLAWKbOjDAsD3vmam7bQSXbLIAc3k
         DIo/10jXpidM2kOOkn5vWn6+muqDTeuHWaPciAB9iH1H8i69Hnn4psNKJeaJhQrQ9LTD
         y43kI/st4Lx1BoWnxUMv0xxCRlfRy/97zlxZMH5w0tBZY0g89gyYsH8QZ7NIy8fgVEg3
         Zt/IxxNg+o5GOOsplb1rtB0CIjNiHBfPJzIUMBWRVXy+qefP+PmR4wG7C0jKZVH97XMv
         pB4jFumuTf4KnqRjHV1OVklez4LOXxNcXRm1uioHYzm5GPSBEFvqNuBDSTP+BkRiVpzI
         ir9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461701; x=1769066501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8h9J5PiwGjRDi4lgWh6a9pAocUe6myz99QYAZpJqDU=;
        b=NAqRHkaVkkQ/xEDWrHNqFEYEz4XnIs8XPHet4dLcKVnG75QpTByqNoiF1JSPYa9Hbx
         fTrPkwZrHRbQY7bMa1+VkpuHhaM9e4zrjTa1XUP+znOIfniwWl8JOGXzLbDw88mR8ak2
         pbFiqDkFeivWJ1o+d2t51C9HW63LeHoCQ0CtG+o++HWsnL8Ugi9XG5/FWBkP8aMk9ju5
         Rwj8tlQRDelh87q5tnVghovUYxLjVjFdwY72zDNMSaZh1VGSWHT7AaLcPRuEIsF97SQk
         GSiFd2W5w/FaKh4I1QMCJwNJhpL5fmaw7d39W78WzWEFTokVwAR+e/GH38RJD0lVhMFk
         GCXw==
X-Forwarded-Encrypted: i=1; AJvYcCW8ujD23THvAyUShw9dh3zRZNuFLyFBfi95gmRjziYhadJKNNWRioTt8WWPJGt46UUxxVWWB/s7fEYQRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcYCiPGUSK3FacdRZSyauJYBWqwdCIXV2b5PRQ4RnbEFjJDk7
	x/6xAXSF7S+TeSKnWP4vN7sRdQOhM5I+AIcXpMHg/ilXu5FDh3+ATB+bkNBowbbiSLQi
X-Gm-Gg: AY/fxX4wIoZiRzZ8L4GX1nUIHtYvZBki2HuElI6YnymQvTuR6iQ0LVZ7sfQN1rldEvL
	AKkTyox+Y8PqmNBFZ0wT95vWU4On4ud2lMRw3Nyev24O2YQyqXo1AwqkyVLdwIo7Nz0Fw+orrrC
	IbBvBo++T5g+Iz8+KJcWP/JW+9k1aotqlIHBfkkacGOvU+Y+owImYm/GYXCwAgRPJ5LuBCRpIx4
	h1nF+0S+4OltmwZWr2zdFv1NqvS62gvvWkI2HUhxeRf3vX3cy6ilK6cMKIoqXx7PjDOmxTI3rUs
	vdjsXFYsEV0uVTidw0Jsn84JjF+oPtrRfDiZlnH5lh7dwZKR96kWh7jDpen4dRVq8yah56QktJr
	8pCsCl5ZGA/Hv0qXViKFXc21QNsyQid45649VCNgRgQhXYypcjmgIB6b0XGB6/+mh4pcGL/yBDT
	j051lQHnBB22/PBw==
X-Received: by 2002:a05:7300:dc97:b0:2ae:5cdc:214c with SMTP id 5a478bee46e88-2b4871e9766mr7159987eec.39.1768461700313;
        Wed, 14 Jan 2026 23:21:40 -0800 (PST)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a55e2sm21277332eec.8.2026.01.14.23.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:21:39 -0800 (PST)
Date: Wed, 14 Jan 2026 23:21:35 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aWiVfyz49P7oWTsn@sultan-box>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain>
 <aV4MYcgdOviulN3E@sultan-box>
 <aWgEtfp1MWioqKox@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWgEtfp1MWioqKox@kekkonen.localdomain>

On Wed, Jan 14, 2026 at 11:03:49PM +0200, Sakari Ailus wrote:
> Hi Sultan,
> 
> On Tue, Jan 06, 2026 at 11:33:53PM -0800, Sultan Alsawaf wrote:
> > Hi Sakari,
> > 
> > On Mon, Dec 22, 2025 at 12:11:11PM +0200, Sakari Ailus wrote:
> > > Hi Bin,
> > > 
> > > On Tue, Dec 16, 2025 at 05:13:23PM +0800, Bin Du wrote:
> > > > +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
> > > > +{
> > > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > > +	struct isp4fw_cmd_set_stream_cfg cmd;
> > > > +	struct device *dev = isp_subdev->dev;
> > > > +
> > > > +	/*
> > > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > > +	 */
> > > > +	memset(&cmd, 0, sizeof(cmd));
> > > 
> > > You could assign assign all these in the declaration and avoid zeroing the
> > > memory explicitly at the same time. I presume possibly leaking some
> > > information from memory to the firmware in case there are holes in the
> > > struct isn't an issue.
> > 
> > Leaking kernel memory is bad. Also, there is no guarantee that the firmware will
> > behave as expected with varying values for the padding bytes.
> > 
> > Please see my arguments from v4 on why these structs should be memset [1].
> 
> There should be no host CPU related ABI introduced padding in structs defining
> firmware interfaces. Just use reserved fields in that case instead. In
> other words, the above memset() is equivalent to zeroing the memory using
> an assignment.

I understand that, but I don't work for AMD and don't have firmware source. :)

My personal preference is to pack firmware interface structs since relying on
reserved fields is subject to human error, especially for future changes to the
firmware interface.

That being said, please see what Bin said about the firmware interface [1]:
"Quoted below is Sultan's reply regarding this, does that make sense? On 
the other hand,  these definitions are shared between the ISP driver and 
firmware and have been verified. I prefer not to add extra padding 
fields to the driver as it would affect consistency. Is it acceptable to 
leave the definitions as they are?"

> > 
> > > > +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
> > > > +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
> > > > +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
> > > > +
> > > > +	cmd.stream_cfg.b_enable_tnr = true;
> > > > +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
> > > > +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
> > > > +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
> > > > +		cmd.stream_cfg.b_enable_tnr);
> > > > +
> > > > +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
> > > > +				   &cmd, sizeof(cmd));
> > > > +}
> > > > +
> > > > +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
> > > > +{
> > > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > > +	struct isp4fw_cmd_send_buffer buf_type;
> > > > +	struct device *dev = isp_subdev->dev;
> > > > +	int i;
> > > 
> > > unsigned int, please. You can also declare this within the loop as you do
> > > elsewhere. Consistency is nice.
> > 
> > Why does this need to be unsigned?
> 
> Do you need negative numbers there?

No, but we don't need to make the variable explicitly unsigned either. It's more
common to see `int i;` than `unsigned int i;` too:

$ rg 'unsigned int i;' drivers/media/ | wc -l
904
$ rg 'int i;' drivers/media/ | rg -v unsigned | wc -l
1208

Making trivial loop iterators unsigned without reason inflates the code and adds
some confusion to future readers trying to understand if the 'unsigned' was
added because it was *required*, IMO.

> > 
> > > > +
> > > > +	/*
> > > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > > +	 */
> > > > +	memset(&buf_type, 0, sizeof(buf_type));
> > > > +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> > > > +		struct isp4if_gpu_mem_info *meta_info_buf =
> > > > +				isp_subdev->ispif.meta_info_buf[i];
> > > > +		int ret;
> > > > +
> > > > +		if (!meta_info_buf) {
> > > > +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
> > > > +			return -ENOMEM;
> > > > +		}
> > > > +
> > > > +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> > > > +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> > > > +		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
> > > > +				    &buf_type.buffer.buf_base_a_lo,
> > > > +				    &buf_type.buffer.buf_base_a_hi);
> > > > +		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
> > > > +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> > > > +					  &buf_type, sizeof(buf_type));
> > > > +		if (ret) {
> > > > +			dev_err(dev, "send meta info(%u) fail\n", i);
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	dev_dbg(dev, "send meta info suc\n");
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
> > > > +				    struct isp4fw_image_prop *out_prop,
> > > > +				    struct v4l2_subdev_state *state, u32 pad)
> > > > +{
> > > > +	struct device *dev = isp_subdev->dev;
> > > > +	struct v4l2_mbus_framefmt *format;
> > > > +
> > > > +	format = v4l2_subdev_state_get_format(state, pad, 0);
> > > > +	if (!format) {
> > > > +		dev_err(dev, "fail get subdev state format\n");
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	switch (format->code) {
> > > > +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> > > > +		out_prop->image_format = IMAGE_FORMAT_NV12;
> > > > +		out_prop->width = format->width;
> > > > +		out_prop->height = format->height;
> > > > +		out_prop->luma_pitch = format->width;
> > > > +		out_prop->chroma_pitch = out_prop->width;
> > > > +		break;
> > > > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > > > +		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
> > > > +		out_prop->width = format->width;
> > > > +		out_prop->height = format->height;
> > > > +		out_prop->luma_pitch = format->width * 2;
> > > > +		out_prop->chroma_pitch = 0;
> > > > +		break;
> > > > +	default:
> > > > +		dev_err(dev, "fail for bad image format:0x%x\n",
> > > > +			format->code);
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (!out_prop->width || !out_prop->height)
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
> > > > +{
> > > > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > > +	struct device *dev = isp_subdev->dev;
> > > > +
> > > > +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
> > > > +		return 0;
> > > > +
> > > > +	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
> > > > +		dev_err(dev, "fail for previous start fail\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	dev_dbg(dev, "w:%u,h:%u\n", w, h);
> > > > +
> > > > +	if (isp4sd_send_meta_buf(isp_subdev)) {
> > > > +		dev_err(dev, "fail to send meta buf\n");
> > > > +		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	sensor_info->status = ISP4SD_START_STATUS_OFF;
> > > > +
> > > > +	if (!sensor_info->start_stream_cmd_sent &&
> > > > +	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
> > > > +		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
> > > > +					      NULL, 0);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "fail to start stream\n");
> > > > +			return ret;
> > > > +		}
> > > > +
> > > > +		sensor_info->start_stream_cmd_sent = true;
> > > > +	} else {
> > > > +		dev_dbg(dev,
> > > > +			"no send START_STREAM, start_sent %u, buf_sent %u\n",
> > > > +			sensor_info->start_stream_cmd_sent,
> > > > +			sensor_info->buf_sent_cnt);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
> > > > +			       struct v4l2_subdev_state *state, u32 pad)
> > > > +{
> > > > +	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
> > > > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > > +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
> > > > +	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
> > > > +	struct device *dev = isp_subdev->dev;
> > > > +	int ret;
> > > > +
> > > > +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
> > > > +		return 0;
> > > > +
> > > > +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
> > > > +		dev_err(dev, "fail for previous start fail\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > > +	 */
> > > > +	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
> > > > +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
> > > > +
> > > > +	if (!isp4sd_get_str_out_prop(isp_subdev, &cmd_ch_prop.image_prop, state, pad)) {
> > > > +		dev_err(dev, "fail to get out prop\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
> > > > +		cmd_ch_prop.ch,
> > > > +		cmd_ch_prop.image_prop.image_format,
> > > > +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
> > > > +		cmd_ch_prop.image_prop.luma_pitch,
> > > > +		cmd_ch_prop.image_prop.chroma_pitch);
> > > > +
> > > > +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
> > > > +				  &cmd_ch_prop, sizeof(cmd_ch_prop));
> > > > +	if (ret) {
> > > > +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> > > > +		dev_err(dev, "fail to set out prop\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > 
> > > You should have explicit padding fields in any case and not rely on ABI in
> > > this case.
> > 
> > It is error-prone for a human to make sure that all padding bytes have
> > explicit struct members. And what about future changes to the firmware
> > API where explicit padding might be forgotten?
> 
> Just don't do that. Use pahole to verify the result when making changes to
> the structs.

Humans are fallible. Someone will undoubtedly make this mistake in the future
without some way in place to either automatically run pahole and scrape the
output for holes in firmware API structs or memset the whole struct at runtime
so it never matters. OR slap __packed onto all those structs.

> > 
> > Unless the firmware API structs are all __packed in a future firmware update, I
> > think the memsets should remain.
> 
> If you want to be certain of the size of the structs, use BUILD_BUG_ON().

This won't help for the addition of new structs and still requires a human to
"do the right thing" and make sure there aren't any holes when they hardcode the
struct size into a compile-time assert.

> -- 
> Kind regards,
> 
> Sakari Ailus

[1] https://lore.kernel.org/all/62bd8248-dd8a-4d51-8a85-ad13d3a03180@amd.com/

Sultan

