Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4652C197A01
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 12:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbgC3K70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 06:59:26 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53107 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729350AbgC3K70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 06:59:26 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Is8RjGLa2Br2bIs8Ujc9QC; Mon, 30 Mar 2020 12:59:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585565959; bh=UvNWfBZ8nPB90+r9YQbLNgEbOhOmDPPR3VqtfD0WSaA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Gywj6JHi5d3bvnXvsAA85sPnOTAhGi+WyPWapinYwNLfctqWDtwM1So09ieFtIL+9
         qhLw7a2ujF8Bl0Y3EYYqsVYcCZtMKEhTb2neRTavb60CT7jOXmmxOVO46347TgHjY1
         A28S+M4MP/isfdXs0X5qTiYVihy+S0dzEwLBfmQ1HO5J0O5hALqxcOoueH/ao7haJP
         4kcAFqZK5PELVXEwXtiZGxWV+egNifLq/m7ciI5y2CZ2Z+LOj7oy+oeD7WeVI3jJb5
         mo8/wxWrmnY3IIjXixUJqueN93+dWZ8awPPePp375wn4tQ8MIODq//CfnpyGM+RbYx
         Dr14aOJnjjKqA==
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
Date:   Mon, 30 Mar 2020 12:59:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325110358.GB853@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGXrxeUnJub+7N47BOracaFiPk3K/GHo0P1IXki+Lw4Ia1ZHJxfWC2sHZJ1OBpWiI+5xv6ojyx53ZjRypEZOZy8Ru9dPEueE/ReCkFh0EBzpqFBR0tYd
 cLu0pZ5d9JbfDvNPgmk+CUt+r+YSLd69VWJvRBQPzvMKRPCcgq8rieF+CR6q5kFZx87pQXx+teQViWjpeOg4XSoqP0cw5pynWdBNsfJOEdNTNEgjx6+xwtfL
 Qm1g31tqIE4nlZ9kjM0zpypDRwSo23kpt/o+0ZmXDglHRUfzxXVk7iyt6r5lBEiRe41Jm3LLq2JMBHmUeIamtC1RkOWK7rVBcBZljtDnWOWLcbmta4cpCwcM
 2em/P5mfLpzZtbLDJP29XP1qyjY4/n2xSBMIAJqtNVnprs1xgm8yli2oMYoznzyITAmyeL0aoei3o5KuhhotoXeh1D/T+yquMQzVafa5tKdcTu4ub/Q/xMw7
 AKwdleCa03JBur4Lw/9/ck55+mPf8Dx6WNXIK1O+Iu400WCHCDn98w+j5OxfutFrwUW+B8UdaggQdV3qsga7A3jigUHuTpwLAfTc6YcMnxgmmPnYOtyoQmOb
 exo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/25/20 12:03 PM, Sakari Ailus wrote:
> Hi Sowjanya,
> 
> Thanks for the patchset.
> 
> On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/staging/media/Kconfig              |    2 +
>>  drivers/staging/media/Makefile             |    1 +
>>  drivers/staging/media/tegra/Kconfig        |   10 +
>>  drivers/staging/media/tegra/Makefile       |    8 +
>>  drivers/staging/media/tegra/TODO           |   10 +
>>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
>>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
>>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
>>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
>>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
>>  drivers/staging/media/tegra/tegra-video.h  |   32 +
>>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
>>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
> 
> Why staging? Are there reasons not to aim this to the kernel proper right
> away? If you only support TPG, the driver may not have too many (if any)
> real users anyway.
> 
>>  14 files changed, 3182 insertions(+)
>>  create mode 100644 drivers/staging/media/tegra/Kconfig
>>  create mode 100644 drivers/staging/media/tegra/Makefile
>>  create mode 100644 drivers/staging/media/tegra/TODO
>>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>>

<snip>

>> +static int tegra_channel_g_input(struct file *file, void *priv,
>> +				 unsigned int *i)
>> +{
>> +	*i = 0;
>> +	return 0;
>> +}
>> +
>> +static int tegra_channel_s_input(struct file *file, void *priv,
>> +				 unsigned int input)
>> +{
>> +	if (input > 0)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
> 
> Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
> linux-media; it's relevant here, too.

No, it isn't. The pipeline is controlled by the driver, not by userspace.
This is a regular video capture driver, not an ISP driver.

<snip>

>> +static int tegra_channel_init(struct tegra_vi_channel *chan)
>> +{
>> +	struct tegra_vi *vi = chan->vi;
>> +	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
>> +	unsigned long flags = HOST1X_SYNCPT_CLIENT_MANAGED;
>> +	int ret;
>> +
>> +	mutex_init(&chan->video_lock);
> 
> Also remember mutex_destroy().
> 
>> +	INIT_LIST_HEAD(&chan->capture);
>> +	INIT_LIST_HEAD(&chan->done);
>> +	spin_lock_init(&chan->start_lock);
>> +	spin_lock_init(&chan->done_lock);
>> +	init_waitqueue_head(&chan->start_wait);
>> +	init_waitqueue_head(&chan->done_wait);
>> +
>> +	/* initialize the video format */
>> +	chan->fmtinfo = &tegra_default_format;
>> +	chan->format.pixelformat = chan->fmtinfo->fourcc;
>> +	chan->format.colorspace = V4L2_COLORSPACE_SRGB;
>> +	chan->format.field = V4L2_FIELD_NONE;
>> +	chan->format.width = TEGRA_DEF_WIDTH;
>> +	chan->format.height = TEGRA_DEF_HEIGHT;
>> +	chan->format.bytesperline = TEGRA_DEF_WIDTH * chan->fmtinfo->bpp;
>> +	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
>> +	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
>> +
>> +	chan->video = video_device_alloc();
> 
> No need to allocate separately; put this into e.g. struct tegra_vi_channel.
> 
>> +	if (!chan->video) {
>> +		dev_err(vi->dev, "unable to allocate video device\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/* initialize the media entity */
>> +	chan->pad.flags = MEDIA_PAD_FL_SINK;
>> +	ret = media_entity_pads_init(&chan->video->entity, 1, &chan->pad);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to initialize media entity: %d\n", ret);
>> +		goto release_vdev;
>> +	}
>> +
>> +	ret = v4l2_ctrl_handler_init(&chan->ctrl_handler, MAX_CID_CONTROLS);
>> +	if (chan->ctrl_handler.error) {
>> +		dev_err(vi->dev,
>> +			"failed to initialize v4l2 ctrl handler: %d\n", ret);
>> +		goto cleanup_media;
>> +	}
>> +
>> +	/* initialize the video_device */
>> +	chan->video->fops = &tegra_channel_fops;
>> +	chan->video->v4l2_dev = &vid->v4l2_dev;
>> +	chan->video->release = video_device_release_empty;
>> +	chan->video->queue = &chan->queue;
>> +	snprintf(chan->video->name, sizeof(chan->video->name), "%s-%s-%u",
>> +		 dev_name(vi->dev), "output", chan->portno);
>> +	chan->video->vfl_type = VFL_TYPE_VIDEO;
>> +	chan->video->vfl_dir = VFL_DIR_RX;
>> +	chan->video->ioctl_ops = &tegra_channel_ioctl_ops;
>> +	chan->video->ctrl_handler = &chan->ctrl_handler;
>> +	chan->video->lock = &chan->video_lock;
>> +	chan->video->device_caps = V4L2_CAP_VIDEO_CAPTURE |
>> +				   V4L2_CAP_STREAMING |
>> +				   V4L2_CAP_READWRITE;
>> +	video_set_drvdata(chan->video, chan);
>> +
>> +	chan->frame_start_sp = host1x_syncpt_request(&vi->client, flags);
>> +	if (!chan->frame_start_sp) {
>> +		dev_err(vi->dev, "failed to request frame start syncpoint\n");
>> +		ret = -ENOMEM;
>> +		goto free_v4l2_ctrl_hdl;
>> +	}
>> +
>> +	chan->mw_ack_sp = host1x_syncpt_request(&vi->client, flags);
>> +	if (!chan->mw_ack_sp) {
>> +		dev_err(vi->dev, "failed to request memory ack syncpoint\n");
>> +		ret = -ENOMEM;
>> +		goto free_fs_syncpt;
>> +	}
>> +
>> +	chan->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +	chan->queue.io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
>> +	chan->queue.lock = &chan->video_lock;
>> +	chan->queue.drv_priv = chan;
>> +	chan->queue.buf_struct_size = sizeof(struct tegra_channel_buffer);
>> +	chan->queue.ops = &tegra_channel_queue_qops;
>> +	chan->queue.min_buffers_needed = 3;
>> +	chan->queue.mem_ops = &vb2_dma_contig_memops;
>> +	chan->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	chan->queue.dev = vi->dev;
>> +	ret = vb2_queue_init(&chan->queue);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev, "failed to initialize vb2 queue: %d\n", ret);
>> +		goto free_mw_ack_syncpt;
>> +	}
>> +
>> +	ret = video_register_device(chan->video, VFL_TYPE_VIDEO, -1);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev, "failed to register video device: %d\n", ret);
>> +		goto rel_vb2_queue;
>> +	}
>> +
>> +	return 0;
>> +
>> +rel_vb2_queue:
>> +	vb2_queue_release(&chan->queue);
>> +free_mw_ack_syncpt:
>> +	host1x_syncpt_free(chan->mw_ack_sp);
>> +free_fs_syncpt:
>> +	host1x_syncpt_free(chan->frame_start_sp);
>> +free_v4l2_ctrl_hdl:
>> +	v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +cleanup_media:
>> +	media_entity_cleanup(&chan->video->entity);
>> +release_vdev:
>> +	video_device_release(chan->video);
>> +	return ret;
>> +}
>> +
>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>> +{
>> +	struct tegra_vi_channel *chan, *tmp;
>> +	unsigned int port_num;
>> +	unsigned int nchannels = vi->soc->vi_max_channels;
>> +	int ret = 0;
>> +
>> +	for (port_num = 0; port_num < nchannels; port_num++) {
>> +		chan = kzalloc(sizeof(*chan), GFP_KERNEL);
>> +		if (!chan) {
>> +			ret = -ENOMEM;
>> +			goto cleanup;
>> +		}
>> +
>> +		chan->vi = vi;
>> +		chan->portno = port_num;
>> +		list_add_tail(&chan->list, &vi->vi_chans);
>> +	}
>> +
>> +	return 0;
>> +
>> +cleanup:
>> +	list_for_each_entry_safe(chan, tmp, &vi->vi_chans, list) {
>> +		list_del(&chan->list);
>> +		kfree(chan);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int tegra_vi_channels_init(struct tegra_vi *vi)
>> +{
>> +	struct tegra_vi_channel *chan;
>> +	int ret;
>> +
>> +	list_for_each_entry(chan, &vi->vi_chans, list) {
>> +		ret = tegra_channel_init(chan);
>> +		if (ret < 0) {
>> +			dev_err(vi->dev, "channel %d init failed: %d\n",
>> +				chan->portno, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_vi_channels_cleanup(struct tegra_vi *vi)
>> +{
>> +	struct tegra_vi_channel *chan, *tmp;
>> +
>> +	list_for_each_entry_safe(chan, tmp, &vi->vi_chans, list) {
>> +		if (chan->video) {
>> +			video_unregister_device(chan->video);
>> +			mutex_lock(&chan->video_lock);
>> +			vb2_queue_release(&chan->queue);
>> +			mutex_unlock(&chan->video_lock);
>> +			video_device_release(chan->video);
>> +		}
>> +
>> +		if (chan->frame_start_sp)
>> +			host1x_syncpt_free(chan->frame_start_sp);
>> +
>> +		if (chan->mw_ack_sp)
>> +			host1x_syncpt_free(chan->mw_ack_sp);
>> +
>> +		v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +
>> +		list_del(&chan->list);
>> +		kfree(chan);
>> +	}
>> +}
>> +
>> +static int tegra_vi_tpg_graph_init(struct tegra_vi *vi)
>> +{
>> +	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
>> +	struct tegra_csi *csi = vid->csi;
>> +	struct tegra_vi_channel *vi_chan;
>> +	struct tegra_csi_channel *csi_chan;
>> +	u32 link_flags = MEDIA_LNK_FL_ENABLED;
>> +	int ret = 0;
>> +
>> +	csi_chan = list_first_entry(&csi->csi_chans, struct tegra_csi_channel,
>> +				    list);
>> +
>> +	list_for_each_entry(vi_chan, &vi->vi_chans, list) {
>> +		struct media_entity *source = &csi_chan->subdev.entity;
>> +		struct media_entity *sink = &vi_chan->video->entity;
>> +		struct media_pad *source_pad = csi_chan->pads;
>> +		struct media_pad *sink_pad = &vi_chan->pad;
>> +
>> +		ret = v4l2_device_register_subdev(&vid->v4l2_dev,
>> +						  &csi_chan->subdev);
> 
> Please first create the links, then register the subdev.
> 
> Where is the corresponding media entity initialised?
> 
>> +		if (ret) {
>> +			dev_err(vi->dev,
>> +				"failed to register subdev: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
>> +			source->name, source_pad->index,
>> +			sink->name, sink_pad->index);
>> +
>> +		ret = media_create_pad_link(source, source_pad->index,
>> +					    sink, sink_pad->index,
>> +					    link_flags);
>> +		if (ret < 0) {
>> +			dev_err(vi->dev,
>> +				"failed to create %s:%u -> %s:%u link: %d\n",
>> +				source->name, source_pad->index,
>> +				sink->name, sink_pad->index, ret);
>> +			return ret;
>> +		}
>> +
>> +		vi_tpg_fmts_bitmap_init(vi_chan);
>> +		tegra_channel_setup_ctrl_handler(vi_chan);
>> +		csi_chan = list_next_entry(csi_chan, list);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_vi_tpg_graph_cleanup(struct tegra_vi *vi)
>> +{
>> +	struct tegra_video_device *vid = dev_get_drvdata(vi->client.host);
>> +	struct tegra_csi *csi = vid->csi;
>> +	struct tegra_csi_channel *csi_chan;
>> +
>> +	list_for_each_entry(csi_chan, &csi->csi_chans, list)
>> +		v4l2_device_unregister_subdev(&csi_chan->subdev);
>> +}
>> +
>> +static int tegra_vi_init(struct host1x_client *client)
>> +{
>> +	struct tegra_video_device *vid = dev_get_drvdata(client->host);
>> +	struct tegra_vi *vi = host1x_client_to_vi(client);
>> +	int ret;
>> +
>> +	vid->vi = vi;
>> +	vid->media_dev.hw_revision = vi->soc->hw_revision;
>> +	snprintf(vid->media_dev.bus_info, sizeof(vid->media_dev.bus_info),
>> +		 "platform:%s", dev_name(vi->dev));
>> +
>> +	if (!vid->csi) {
>> +		dev_err(vi->dev, "csi host1x client is not initialized\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&vi->vi_chans);
>> +
>> +	ret = tegra_vi_tpg_channels_alloc(vi);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = tegra_vi_channels_init(vi);
>> +	if (ret < 0)
>> +		goto cleanup;
>> +
>> +	ret = pm_runtime_get_sync(vi->dev);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev, "runtime resume failed: %d\n", ret);
>> +		goto cleanup;
> 
> s/cleanup/rpm_put/
> 
>> +	}
>> +
>> +	/* setup media links between Tegra VI and CSI for TPG */
>> +	ret = tegra_vi_tpg_graph_init(vi);
>> +	if (ret < 0)
>> +		goto rpm_put;
>> +
>> +	return 0;
>> +
>> +rpm_put:
>> +	pm_runtime_put_sync(vi->dev);
>> +cleanup:
>> +	tegra_vi_channels_cleanup(vi);
>> +	return ret;
>> +}
>> +
>> +static int tegra_vi_exit(struct host1x_client *client)
>> +{
>> +	struct tegra_video_device *vid = dev_get_drvdata(client->host);
>> +	struct tegra_vi *vi = vid->vi;
>> +
>> +	if (!vid->vi)
>> +		return 0;
>> +
>> +	tegra_vi_channels_cleanup(vi);
>> +	tegra_vi_tpg_graph_cleanup(vi);
>> +	pm_runtime_put_sync(vi->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct host1x_client_ops vi_client_ops = {
>> +	.init = tegra_vi_init,
>> +	.exit = tegra_vi_exit,
>> +};
>> +
>> +static int tegra_vi_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	struct tegra_vi *vi;
>> +	int ret;
>> +
>> +	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
> 
> You could use devm_kzalloc(), and not worry about freeing it.

That would likely fail if the driver is unbound.

Regards,

	Hans

> 
>> +	if (!vi)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	vi->iomem = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(vi->iomem)) {
>> +		ret = PTR_ERR(vi->iomem);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->soc = of_device_get_match_data(&pdev->dev);
>> +	if (!vi->soc) {
>> +		ret = -ENODATA;
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->vi_clk = devm_clk_get(&pdev->dev, "vi");
>> +	if (IS_ERR(vi->vi_clk)) {
>> +		ret = PTR_ERR(vi->vi_clk);
>> +		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->vi_reg = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
>> +	if (IS_ERR(vi->vi_reg)) {
>> +		ret = PTR_ERR(vi->vi_reg);
>> +		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	if (!pdev->dev.pm_domain) {
>> +		ret = -ENOENT;
>> +		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev,
>> +			"failed to populate vi child device: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->dev = &pdev->dev;
>> +	vi->ops = vi->soc->ops;
>> +	platform_set_drvdata(pdev, vi);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	/* initialize host1x interface */
>> +	INIT_LIST_HEAD(&vi->client.list);
>> +	vi->client.ops = &vi_client_ops;
>> +	vi->client.dev = &pdev->dev;
>> +
>> +	ret = host1x_client_register(&vi->client);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to register host1x client: %d\n", ret);
>> +		ret = -ENODEV;
>> +		goto rpm_disable;
>> +	}
>> +
>> +	return 0;
>> +
>> +rpm_disable:
>> +	pm_runtime_disable(&pdev->dev);
>> +	of_platform_depopulate(vi->dev);
>> +cleanup:
>> +	kfree(vi);
>> +	return ret;
>> +}
>> +
>> +static int tegra_vi_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_vi *vi = platform_get_drvdata(pdev);
>> +	int err;
>> +
>> +	pm_runtime_disable(vi->dev);
> 
> Does this driver work without runtime PM (CONFIG_PM nowadays)?
> 
>> +
>> +	err = host1x_client_unregister(&vi->client);
>> +	if (err < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to unregister host1x client: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	of_platform_depopulate(vi->dev);
>> +	kfree(vi);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vi_runtime_resume(struct device *dev)
>> +{
>> +	struct tegra_vi *vi = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = regulator_enable(vi->vi_reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_set_rate(vi->vi_clk, vi->soc->vi_max_clk_hz);
>> +	if (ret) {
>> +		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
>> +		goto disable_vi_reg;
>> +	}
>> +
>> +	ret = clk_prepare_enable(vi->vi_clk);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable vi clock: %d\n", ret);
>> +		goto disable_vi_reg;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_vi_reg:
>> +	regulator_disable(vi->vi_reg);
>> +	return ret;
>> +}
>> +
>> +static int vi_runtime_suspend(struct device *dev)
>> +{
>> +	struct tegra_vi *vi = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(vi->vi_clk);
>> +	regulator_disable(vi->vi_reg);
>> +
>> +	return 0;
>> +}
>> +
>> +/* Tegra supported video formats */
>> +const struct tegra_video_format tegra210_video_formats[] = {
>> +	/* RAW 8 */
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SGBRG8_1X8, 1, T_L8, SGBRG8),
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SBGGR8_1X8, 1, T_L8, SBGGR8),
>> +	/* RAW 10 */
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SRGGB10_1X10, 2, T_R16_I, SRGGB10),
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SGRBG10_1X10, 2, T_R16_I, SGRBG10),
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SGBRG10_1X10, 2, T_R16_I, SGBRG10),
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SBGGR10_1X10, 2, T_R16_I, SBGGR10),
>> +	/* RAW 12 */
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SRGGB12_1X12, 2, T_R16_I, SRGGB12),
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SGRBG12_1X12, 2, T_R16_I, SGRBG12),
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
>> +	/* RGB888 */
>> +	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
>> +	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
>> +			   XBGR32),
>> +	/* YUV422 */
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, UYVY),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, VYUY),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, YUYV),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, YVYU),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_1X16, 1, T_Y8__V8U8_N422, NV16),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, UYVY),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, VYUY),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, YUYV),
>> +	TEGRA_VIDEO_FORMAT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, YVYU),
>> +};
>> +
>> +static const struct tegra_vi_ops tegra210_vi_ops = {
>> +	.vi_start_streaming = tegra210_vi_start_streaming,
>> +	.vi_stop_streaming = tegra210_vi_stop_streaming,
>> +};
>> +
>> +static const struct tegra_vi_soc tegra210_vi_soc = {
>> +	.video_formats = tegra210_video_formats,
>> +	.nformats = ARRAY_SIZE(tegra210_video_formats),
>> +	.ops = &tegra210_vi_ops,
>> +	.hw_revision = 3,
>> +	.vi_max_channels = 6,
>> +	.vi_max_clk_hz = 499200000,
>> +};
>> +
>> +static const struct of_device_id tegra_vi_of_id_table[] = {
>> +	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_vi_of_id_table);
>> +
>> +static const struct dev_pm_ops tegra_vi_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(vi_runtime_suspend, vi_runtime_resume, NULL)
>> +};
>> +
>> +struct platform_driver tegra_vi_driver = {
>> +	.driver = {
>> +		.name = "tegra-vi",
>> +		.of_match_table = tegra_vi_of_id_table,
>> +		.pm = &tegra_vi_pm_ops,
>> +	},
>> +	.probe = tegra_vi_probe,
>> +	.remove = tegra_vi_remove,
>> +};
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/tegra-vi.h b/drivers/staging/media/tegra/tegra-vi.h
>> new file mode 100644
>> index 0000000..d639b36
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-vi.h
>> @@ -0,0 +1,83 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __TEGRA_VI_H__
>> +#define __TEGRA_VI_H__
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/videodev2.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-common.h"
>> +
>> +/**
>> + * struct tegra_vi_ops - Tegra VI operations
>> + * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
>> + *		VI for capture and runs capture start and capture finish
>> + *		kthreads for capturing frames to buffer and returns them back.
>> + * @vi_stop_streaming: stops media pipeline and subdevice streaming and returns
>> + *		back any queued buffers.
>> + */
>> +struct tegra_vi_ops {
>> +	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
>> +	void (*vi_stop_streaming)(struct vb2_queue *vq);
>> +};
>> +
>> +/**
>> + * struct tegra_vi_soc - NVIDIA Tegra Video Input SoC structure
>> + *
>> + * @video_formats: supported video formats
>> + * @nformats: total video formats
>> + * @ops: vi operations
>> + * @hw_revision: VI hw_revision
>> + * @vi_max_channels: supported max streaming channels
>> + * @vi_max_clk_hz: VI clock max frequency
>> + */
>> +struct tegra_vi_soc {
>> +	const struct tegra_video_format *video_formats;
>> +	const unsigned int nformats;
>> +	const struct tegra_vi_ops *ops;
>> +	u32 hw_revision;
>> +	unsigned int vi_max_channels;
>> +	unsigned int vi_max_clk_hz;
>> +};
>> +
>> +/**
>> + * struct tegra_vi - NVIDIA Tegra Video Input device structure
>> + *
>> + * @dev: device struct
>> + * @client: host1x_client struct
>> + * @iomem: register base
>> + * @vi_clk: main clock for VI block
>> + * @vi_reg: regulator for VI hardware, normally it avdd_dsi_csi
>> + * @soc: pointer to SoC data structure
>> + * @ops: vi operations
>> + * @vi_chans: list head for VI channels
>> + */
>> +struct tegra_vi {
>> +	struct device *dev;
>> +	struct host1x_client client;
>> +	void __iomem *iomem;
>> +	struct clk *vi_clk;
>> +	struct regulator *vi_reg;
>> +	const struct tegra_vi_soc *soc;
>> +	const struct tegra_vi_ops *ops;
>> +	struct list_head vi_chans;
>> +};
>> +
>> +void tegra210_vi_stop_streaming(struct vb2_queue *vq);
>> +int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count);
>> +
>> +#endif /* __TEGRA_VI_H__ */
>> diff --git a/drivers/staging/media/tegra/tegra-video.c b/drivers/staging/media/tegra/tegra-video.c
>> new file mode 100644
>> index 0000000..bd3718e
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-video.c
>> @@ -0,0 +1,129 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "tegra-video.h"
>> +
>> +static void tegra_v4l2_dev_release(struct v4l2_device *v4l2_dev)
>> +{
>> +	struct tegra_video_device *vid;
>> +
>> +	vid = container_of(v4l2_dev, struct tegra_video_device, v4l2_dev);
>> +	v4l2_device_unregister(v4l2_dev);
>> +	kfree(vid);
>> +}
>> +
>> +static int host1x_video_probe(struct host1x_device *dev)
>> +{
>> +	struct tegra_video_device *vid;
>> +	int ret;
>> +
>> +	vid = kzalloc(sizeof(*vid), GFP_KERNEL);
>> +	if (!vid)
>> +		return -ENOMEM;
>> +
>> +	vid->media_dev.dev = get_device(&dev->dev);
>> +	strscpy(vid->media_dev.model, "NVIDIA Tegra Video Input Device",
>> +		sizeof(vid->media_dev.model));
>> +
>> +	media_device_init(&vid->media_dev);
>> +	ret = media_device_register(&vid->media_dev);
>> +	if (ret < 0) {
>> +		dev_err(vid->media_dev.dev,
>> +			"failed to register media device: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vid->v4l2_dev.mdev = &vid->media_dev;
>> +	vid->v4l2_dev.release = tegra_v4l2_dev_release;
>> +	dev_set_drvdata(&dev->dev, vid);
>> +	ret = v4l2_device_register(vid->media_dev.dev, &vid->v4l2_dev);
>> +	if (ret < 0) {
>> +		dev_err(vid->media_dev.dev,
>> +			"V4L2 device registration failed: %d\n", ret);
>> +		goto unregister_media;
>> +	}
>> +
>> +	ret = host1x_device_init(dev);
>> +	if (ret < 0)
>> +		goto unregister_v4l2;
>> +
>> +	return 0;
>> +
>> +unregister_v4l2:
>> +	v4l2_device_unregister(&vid->v4l2_dev);
>> +unregister_media:
>> +	media_device_unregister(&vid->media_dev);
>> +cleanup:
>> +	media_device_cleanup(&vid->media_dev);
>> +	kfree(vid);
>> +	return ret;
>> +}
>> +
>> +static int host1x_video_remove(struct host1x_device *dev)
>> +{
>> +	struct tegra_video_device *vid = dev_get_drvdata(&dev->dev);
>> +
>> +	host1x_device_exit(dev);
>> +	media_device_unregister(&vid->media_dev);
>> +	media_device_cleanup(&vid->media_dev);
>> +	v4l2_device_disconnect(&vid->v4l2_dev);
>> +	v4l2_device_put(&vid->v4l2_dev);
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id host1x_video_subdevs[] = {
>> +	{ .compatible = "nvidia,tegra210-csi", },
>> +	{ .compatible = "nvidia,tegra210-vi", },
>> +	{ }
>> +};
>> +
>> +static struct host1x_driver host1x_video_driver = {
>> +	.driver = {
>> +		.name = "tegra-video",
>> +	},
>> +	.probe = host1x_video_probe,
>> +	.remove = host1x_video_remove,
>> +	.subdevs = host1x_video_subdevs,
>> +};
>> +
>> +static struct platform_driver * const drivers[] = {
>> +	&tegra_csi_driver,
>> +	&tegra_vi_driver,
>> +};
>> +
>> +static int __init host1x_video_init(void)
>> +{
>> +	int err;
>> +
>> +	err = host1x_driver_register(&host1x_video_driver);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	err = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
>> +	if (err < 0)
>> +		goto unregister_host1x;
>> +
>> +	return 0;
>> +
>> +unregister_host1x:
>> +	host1x_driver_unregister(&host1x_video_driver);
>> +	return err;
>> +}
>> +module_init(host1x_video_init);
>> +
>> +static void __exit host1x_video_exit(void)
>> +{
>> +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
>> +	host1x_driver_unregister(&host1x_video_driver);
>> +}
>> +module_exit(host1x_video_exit);
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Host1x Video driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/tegra-video.h b/drivers/staging/media/tegra/tegra-video.h
>> new file mode 100644
>> index 0000000..1e2ae64
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-video.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __TEGRA_VIDEO_H__
>> +#define __TEGRA_VIDEO_H__
>> +
>> +#include <linux/host1x.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-vi.h"
>> +#include "tegra-csi.h"
>> +
>> +struct tegra_video_device {
>> +	struct v4l2_device v4l2_dev;
>> +	struct media_device media_dev;
>> +	struct tegra_vi *vi;
>> +	struct tegra_csi *csi;
>> +};
>> +
>> +extern struct platform_driver tegra_vi_driver;
>> +extern struct platform_driver tegra_csi_driver;
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/tegra210.c b/drivers/staging/media/tegra/tegra210.c
>> new file mode 100644
>> index 0000000..eb547bb
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra210.c
>> @@ -0,0 +1,754 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +/*
>> + * This source file contains both VI and CSI specific operations and
>> + * registers accessors.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/delay.h>
>> +#include <linux/freezer.h>
>> +#include <linux/completion.h>
>> +
>> +#include "tegra-common.h"
>> +#include "tegra-csi.h"
>> +#include "tegra-vi.h"
>> +#include "tegra210.h"
>> +
>> +#define TEGRA210_CSI_PORT_OFFSET		0x34
>> +#define TEGRA210_CSI_CIL_OFFSET			0x0f4
>> +#define TEGRA210_CSI_TPG_OFFSET			0x18c
>> +
>> +#define CSI_PP_OFFSET(block)			((block) * 0x800)
>> +#define TEGRA210_VI_CSI_BASE(x)			(0x100 + (x) * 0x100)
>> +
>> +/* Tegra210 VI registers accessors */
>> +static void tegra_vi_write(struct tegra_vi_channel *chan, unsigned int addr,
>> +			   u32 val)
>> +{
>> +	writel(val, chan->vi->iomem + addr);
>> +}
>> +
>> +static u32 tegra_vi_read(struct tegra_vi_channel *chan, unsigned int addr)
>> +{
>> +	return readl(chan->vi->iomem + addr);
>> +}
>> +
>> +/* Tegra210 VI_CSI registers accessors */
>> +static void vi_csi_write(struct tegra_vi_channel *chan, unsigned int addr,
>> +			 u32 val)
>> +{
>> +	void __iomem *vi_csi_base;
>> +
>> +	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
>> +
>> +	writel(val, vi_csi_base + addr);
>> +}
>> +
>> +static u32 vi_csi_read(struct tegra_vi_channel *chan, unsigned int addr)
>> +{
>> +	void __iomem *vi_csi_base;
>> +
>> +	vi_csi_base = chan->vi->iomem + TEGRA210_VI_CSI_BASE(chan->portno);
>> +
>> +	return readl(vi_csi_base + addr);
>> +}
>> +
>> +/*
>> + * Tegra210 VI channel capture operations
>> + */
>> +static int tegra_channel_capture_setup(struct tegra_vi_channel *chan)
>> +{
>> +	u32 height = chan->format.height;
>> +	u32 width = chan->format.width;
>> +	u32 format = chan->fmtinfo->img_fmt;
>> +	u32 data_type = chan->fmtinfo->img_dt;
>> +	u32 word_count = (width * chan->fmtinfo->bit_width) / 8;
>> +
>> +	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xffffffff);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF,
>> +		     ((chan->pg_mode ? 0 : 1) << BYPASS_PXL_TRANSFORM_OFFSET) |
>> +		     (format << IMAGE_DEF_FORMAT_OFFSET) |
>> +		     IMAGE_DEF_DEST_MEM);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DT, data_type);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE_WC, word_count);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE,
>> +		     (height << IMAGE_SIZE_HEIGHT_OFFSET) | width);
>> +	return 0;
>> +}
>> +
>> +static void tegra_channel_vi_soft_reset(struct tegra_vi_channel *chan)
>> +{
>> +	/* disable clock gating to enable continuous clock */
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>> +	/*
>> +	 * Soft reset memory client interface, pixel format logic, sensor
>> +	 * control logic, and a shadow copy logic to bring VI to clean state.
>> +	 */
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xf);
>> +	usleep_range(100, 200);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
>> +
>> +	/* enable back VI clock gating */
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
>> +}
>> +
>> +static void tegra_channel_capture_error_recover(struct tegra_vi_channel *chan)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * Recover VI and CSI hardware blocks in case of missing frame start
>> +	 * events due to source not streaming or noisy csi inputs from the
>> +	 * external source or many outstanding frame start or MW_ACK_DONE
>> +	 * events which can cause CSI and VI hardware hang.
>> +	 * This helps to have a clean capture for next frame.
>> +	 */
>> +	val = vi_csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
>> +	dev_dbg(&chan->video->dev, "TEGRA_VI_CSI_ERROR_STATUS 0x%08x\n", val);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
>> +
>> +	val = tegra_vi_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR);
>> +	dev_dbg(&chan->video->dev,
>> +		"TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR 0x%08x\n", val);
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
>> +
>> +	/* disable the stream */
>> +	tegra_channel_set_stream(chan, false);
>> +
>> +	/* recover VI and CSI blocks by issuing software reset */
>> +	tegra_channel_csi_error_recover(chan);
>> +	tegra_channel_vi_soft_reset(chan);
>> +
>> +	/* re-init VI and enable back the stream */
>> +	tegra_channel_capture_setup(chan);
>> +	tegra_channel_set_stream(chan, true);
>> +}
>> +
>> +static struct tegra_channel_buffer *
>> +dequeue_buf_done(struct tegra_vi_channel *chan)
>> +{
>> +	struct tegra_channel_buffer *buf = NULL;
>> +
>> +	spin_lock(&chan->done_lock);
>> +	if (list_empty(&chan->done)) {
>> +		spin_unlock(&chan->done_lock);
>> +		return NULL;
>> +	}
>> +
>> +	buf = list_entry(chan->done.next, struct tegra_channel_buffer,
>> +			 queue);
>> +	if (buf)
>> +		list_del_init(&buf->queue);
>> +
>> +	spin_unlock(&chan->done_lock);
>> +
>> +	return buf;
>> +}
>> +
>> +static void release_buffer(struct tegra_vi_channel *chan,
>> +			   struct tegra_channel_buffer *buf,
>> +			   enum vb2_buffer_state state)
>> +{
>> +	struct vb2_v4l2_buffer *vb = &buf->buf;
>> +
>> +	vb->sequence = chan->sequence++;
>> +	vb->field = V4L2_FIELD_NONE;
>> +	vb->vb2_buf.timestamp = ktime_get_ns();
>> +	vb2_buffer_done(&vb->vb2_buf, state);
>> +}
>> +
>> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
>> +				       struct tegra_channel_buffer *buf)
>> +{
>> +	int err = 0;
>> +	u32 thresh, value, frame_start, mw_ack_done;
>> +	int bytes_per_line = chan->format.bytesperline;
>> +
>> +	/* program buffer address by using surface 0 */
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
>> +		     (u64)buf->addr >> 32);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
>> +
>> +	/*
>> +	 * Tegra VI block interacts with host1x syncpt for synchronizing
>> +	 * programmed condition of capture state and hardware operation.
>> +	 * Frame start and Memory write acknowledge syncpts has their own
>> +	 * FIFO of depth 2.
>> +	 *
>> +	 * Syncpoint trigger conditions set through VI_INCR_SYNCPT register
>> +	 * are added to HW syncpt FIFO and when the HW triggers, syncpt
>> +	 * condition is removed from the FIFO and counter at syncpoint index
>> +	 * will be incremented by the hardware and software can wait for
>> +	 * counter to reach threshold to synchronize capturing frame with the
>> +	 * hardware capture events.
>> +	 */
>> +
>> +	/* increase channel syncpoint threshold for FRAME_START */
>> +	thresh = host1x_syncpt_incr_max(chan->frame_start_sp, 1);
>> +
>> +	/* Program FRAME_START trigger condition syncpt request */
>> +	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
>> +	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
>> +		host1x_syncpt_id(chan->frame_start_sp);
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +	/* increase channel syncpoint threshold for MW_ACK_DONE */
>> +	buf->mw_ack_sp_thresh = host1x_syncpt_incr_max(chan->mw_ack_sp, 1);
>> +
>> +	/* Program MW_ACK_DONE trigger condition syncpt request */
>> +	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
>> +	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
>> +		host1x_syncpt_id(chan->mw_ack_sp);
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +	/* enable single shot capture */
>> +	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
>> +	chan->capture_reqs++;
>> +
>> +	/* wait for syncpt counter to reach frame start event threshold */
>> +	err = host1x_syncpt_wait(chan->frame_start_sp, thresh,
>> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>> +	if (err) {
>> +		dev_err(&chan->video->dev,
>> +			"frame start syncpt timeout: %d\n", err);
>> +		/* increment syncpoint counter for timedout events */
>> +		host1x_syncpt_incr(chan->frame_start_sp);
>> +		spin_lock(&chan->sp_incr_lock);
>> +		host1x_syncpt_incr(chan->mw_ack_sp);
>> +		spin_unlock(&chan->sp_incr_lock);
>> +		/* clear errors and recover */
>> +		tegra_channel_capture_error_recover(chan);
>> +		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
>> +		return err;
>> +	}
>> +
>> +	/* move buffer to capture done queue */
>> +	spin_lock(&chan->done_lock);
>> +	list_add_tail(&buf->queue, &chan->done);
>> +	spin_unlock(&chan->done_lock);
>> +
>> +	/* wait up kthread for capture done */
>> +	wake_up_interruptible(&chan->done_wait);
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_channel_capture_done(struct tegra_vi_channel *chan,
>> +				       struct tegra_channel_buffer *buf)
>> +{
>> +	enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
>> +	u32 value;
>> +	int ret;
>> +
>> +	/* wait for syncpt counter to reach MW_ACK_DONE event threshold */
>> +	ret = host1x_syncpt_wait(chan->mw_ack_sp, buf->mw_ack_sp_thresh,
>> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>> +	if (ret) {
>> +		dev_err(&chan->video->dev,
>> +			"MW_ACK_DONE syncpt timeout: %d\n", ret);
>> +		state = VB2_BUF_STATE_ERROR;
>> +		/* increment syncpoint counter for timedout event */
>> +		spin_lock(&chan->sp_incr_lock);
>> +		host1x_syncpt_incr(chan->mw_ack_sp);
>> +		spin_unlock(&chan->sp_incr_lock);
>> +	}
>> +
>> +	release_buffer(chan, buf, state);
>> +}
>> +
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +	struct tegra_vi_channel *chan = data;
>> +	struct tegra_channel_buffer *buf;
>> +	int err = 0;
>> +	int caps_inflight;
>> +
>> +	set_freezable();
> 
> Do you have a particular reason to use a kernel thread, instead of using
> the context of the user process (or threaded interrupt handler)?
> 
>> +
>> +	while (1) {
>> +		try_to_freeze();
>> +
>> +		wait_event_interruptible(chan->start_wait,
>> +					 !list_empty(&chan->capture) ||
>> +					 kthread_should_stop());
>> +		/*
>> +		 * Frame start and MW_ACK_DONE syncpoint condition FIFOs are
>> +		 * of max depth 2. So make sure max 2 capture requests are
>> +		 * in process by the hardware at a time.
>> +		 */
>> +		while (!(kthread_should_stop() || list_empty(&chan->capture))) {
>> +			caps_inflight = chan->capture_reqs - chan->sequence;
>> +			/*
>> +			 * Source is not streaming if error is non-zero.
>> +			 * So, do not dequeue buffers on capture error or when
>> +			 * syncpoint requests in FIFO are full.
>> +			 */
>> +			if (err || caps_inflight >= SYNCPT_FIFO_DEPTH)
>> +				break;
>> +
>> +			/* dequeue the buffer and start capture */
>> +			spin_lock(&chan->start_lock);
>> +			if (list_empty(&chan->capture))
>> +				break;
>> +			buf = list_entry(chan->capture.next,
>> +					 struct tegra_channel_buffer, queue);
>> +			list_del_init(&buf->queue);
>> +			spin_unlock(&chan->start_lock);
>> +
>> +			err = tegra_channel_capture_frame(chan, buf);
>> +			if (err)
>> +				vb2_queue_error(&chan->queue);
>> +		}
>> +
>> +		if (kthread_should_stop())
>> +			break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int chan_capture_kthread_finish(void *data)
>> +{
>> +	struct tegra_vi_channel *chan = data;
>> +	struct tegra_channel_buffer *buf;
>> +
>> +	set_freezable();
>> +
>> +	while (1) {
>> +		try_to_freeze();
>> +
>> +		wait_event_interruptible(chan->done_wait,
>> +					 !list_empty(&chan->done) ||
>> +					 kthread_should_stop());
>> +		/* dequeue buffers and finish capture */
>> +		buf = dequeue_buf_done(chan);
>> +		while (buf) {
>> +			tegra_channel_capture_done(chan, buf);
>> +			buf = dequeue_buf_done(chan);
>> +		}
>> +
>> +		if (kthread_should_stop())
>> +			break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
>> +{
>> +	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>> +	struct media_pipeline *pipe = &chan->video->pipe;
>> +	int ret;
>> +
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
>> +
>> +	/* clear errors */
>> +	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xffffffff);
>> +
>> +	/*
>> +	 * Sync point FIFO full stalls the host interface.
>> +	 * Setting NO_STALL will drop INCR_SYNCPT methods when fifos are
>> +	 * full and the corresponding condition bits in INCR_SYNCPT_ERROR
>> +	 * register will be set.
>> +	 * This allows SW to process error recovery.
>> +	 */
>> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL,
>> +		       TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL);
>> +
>> +	/* start the pipeline */
>> +	ret = media_pipeline_start(&chan->video->entity, pipe);
>> +	if (ret < 0)
>> +		goto error_pipeline_start;
>> +
>> +	tegra_channel_capture_setup(chan);
>> +	ret = tegra_channel_set_stream(chan, true);
>> +	if (ret < 0)
>> +		goto error_set_stream;
>> +
>> +	chan->capture_reqs = 0;
>> +	chan->sequence = 0;
>> +
>> +	/* start kthreads to capture data to buffer and return them */
>> +	chan->kthread_start_capture = kthread_run(chan_capture_kthread_start,
>> +						  chan, "%s:0",
>> +						  chan->video->name);
>> +	if (IS_ERR(chan->kthread_start_capture)) {
>> +		ret = PTR_ERR(chan->kthread_start_capture);
>> +		chan->kthread_start_capture = NULL;
>> +		dev_err(&chan->video->dev,
>> +			"failed to run capture start kthread: %d\n", ret);
>> +		goto error_kthread_start;
>> +	}
>> +
>> +	chan->kthread_finish_capture = kthread_run(chan_capture_kthread_finish,
>> +						   chan, "%s:1",
>> +						   chan->video->name);
>> +	if (IS_ERR(chan->kthread_finish_capture)) {
>> +		ret = PTR_ERR(chan->kthread_finish_capture);
>> +		chan->kthread_finish_capture = NULL;
>> +		dev_err(&chan->video->dev,
>> +			"failed to run capture finish kthread: %d\n", ret);
>> +		goto error_kthread_done;
>> +	}
>> +
>> +	return 0;
>> +
>> +error_kthread_done:
>> +	kthread_stop(chan->kthread_start_capture);
>> +error_kthread_start:
>> +	tegra_channel_set_stream(chan, false);
>> +error_set_stream:
>> +	media_pipeline_stop(&chan->video->entity);
>> +error_pipeline_start:
>> +	vq->start_streaming_called = 0;
>> +	tegra_channel_release_buffers(chan, VB2_BUF_STATE_QUEUED);
>> +	return ret;
>> +}
>> +
>> +void tegra210_vi_stop_streaming(struct vb2_queue *vq)
>> +{
>> +	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>> +
>> +	if (chan->kthread_start_capture) {
>> +		kthread_stop(chan->kthread_start_capture);
>> +		chan->kthread_start_capture = NULL;
>> +	}
>> +
>> +	if (chan->kthread_finish_capture) {
>> +		kthread_stop(chan->kthread_finish_capture);
>> +		chan->kthread_finish_capture = NULL;
>> +	}
>> +
>> +	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
>> +	tegra_channel_set_stream(chan, false);
>> +	media_pipeline_stop(&chan->video->entity);
>> +}
>> +
>> +/* Tegra210 CSI PHY registers accessors */
>> +static void csi_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
>> +		      u32 val)
>> +{
>> +	void __iomem *csi_pp_base;
>> +
>> +	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +
>> +	writel(val, csi_pp_base + addr);
>> +}
>> +
>> +/* Tegra210 CSI Pixel parser registers accessors */
>> +static void pp_write(struct tegra_csi *csi, u8 portno, u32 addr, u32 val)
>> +{
>> +	void __iomem *csi_pp_base;
>> +	unsigned int offset;
>> +
>> +	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
>> +
>> +	writel(val, csi_pp_base + offset + addr);
>> +}
>> +
>> +static u32 pp_read(struct tegra_csi *csi, u8 portno, u32 addr)
>> +{
>> +	void __iomem *csi_pp_base;
>> +	unsigned int offset;
>> +
>> +	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
>> +
>> +	return readl(csi_pp_base + offset + addr);
>> +}
>> +
>> +/* Tegra210 CSI CIL A/B port registers accessors */
>> +static void cil_write(struct tegra_csi *csi, u8 portno, u32 addr, u32 val)
>> +{
>> +	void __iomem *csi_cil_base;
>> +	unsigned int offset;
>> +
>> +	csi_cil_base = csi->iomem + CSI_PP_OFFSET(portno >> 1) +
>> +		       TEGRA210_CSI_CIL_OFFSET;
>> +	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
>> +
>> +	writel(val, csi_cil_base + offset + addr);
>> +}
>> +
>> +static u32 cil_read(struct tegra_csi *csi, u8 portno, u32 addr)
>> +{
>> +	void __iomem *csi_cil_base;
>> +	unsigned int offset;
>> +
>> +	csi_cil_base = csi->iomem + CSI_PP_OFFSET(portno >> 1) +
>> +		       TEGRA210_CSI_CIL_OFFSET;
>> +	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET;
>> +
>> +	return readl(csi_cil_base + offset + addr);
>> +}
>> +
>> +/* Tegra210 CSI Test pattern generator registers accessor */
>> +static void tpg_write(struct tegra_csi *csi, u8 portno, unsigned int addr,
>> +		      u32 val)
>> +{
>> +	void __iomem *csi_pp_base;
>> +	unsigned int offset;
>> +
>> +	csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +	offset = (portno % CSI_PORTS_PER_BRICK) * TEGRA210_CSI_PORT_OFFSET +
>> +		 TEGRA210_CSI_TPG_OFFSET;
>> +
>> +	writel(val, csi_pp_base + offset + addr);
>> +}
>> +
>> +/*
>> + * Tegra210 CSI operations
>> + */
>> +void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
>> +{
>> +	struct tegra_csi *csi = csi_chan->csi;
>> +	unsigned int port_num = csi_chan->csi_port_num;
>> +	u32 val;
>> +
>> +	/*
>> +	 * Recover CSI hardware in case of capture errors by issuing
>> +	 * software reset to CSICIL sensor, pixel parser, and clear errors
>> +	 * to have clean capture on  next streaming.
>> +	 */
>> +	val = pp_read(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +	dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n", val);
>> +
>> +	val = cil_read(csi, port_num, TEGRA_CSI_CIL_STATUS);
>> +	dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +
>> +	val = cil_read(csi, port_num, TEGRA_CSI_CILX_STATUS);
>> +	dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +
>> +	if (csi_chan->numlanes == 4) {
>> +		/* reset CSI CIL sensor */
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
>> +		cil_write(csi, port_num + 1,
>> +			  TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
>> +		/*
>> +		 * SW_STATUS_RESET resets all status bits of PPA, PPB, CILA,
>> +		 * CILB status registers and debug counters.
>> +		 * So, SW_STATUS_RESET can be used only when CSI Brick is in
>> +		 * x4 mode.
>> +		 */
>> +		csi_write(csi, port_num, TEGRA_CSI_CSI_SW_STATUS_RESET, 0x1);
>> +
>> +		/* sleep for 20 clock cycles to drain the FIFO */
>> +		usleep_range(10, 20);
>> +
>> +		cil_write(csi, port_num + 1,
>> +			  TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
>> +		csi_write(csi, port_num, TEGRA_CSI_CSI_SW_STATUS_RESET, 0x0);
>> +	} else {
>> +		/* reset CSICIL sensor */
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x1);
>> +		usleep_range(10, 20);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_SW_SENSOR_RESET, 0x0);
>> +
>> +		/* clear the errors */
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS,
>> +			 0xffffffff);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, 0xffffffff);
>> +		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, 0xffffffff);
>> +	}
>> +}
>> +
>> +int tegra210_csi_streaming(struct tegra_csi_channel *csi_chan, u8 pg_mode,
>> +			   int enable)
>> +{
>> +	struct tegra_csi *csi = csi_chan->csi;
>> +	unsigned int port_num = csi_chan->csi_port_num;
>> +
>> +	if (enable) {
>> +		csi_write(csi, port_num, TEGRA_CSI_CLKEN_OVERRIDE, 0);
>> +
>> +		/* clean up status */
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS,
>> +			 0xffffffff);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, 0xffffffff);
>> +		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, 0xffffffff);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +		/* CIL PHY registers setup */
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_PHY_CONTROL, 0xa);
>> +
>> +		/*
>> +		 * The CSI unit provides for connection of up to six cameras in
>> +		 * the system and is organized as three identical instances of
>> +		 * two MIPI support blocks, each with a separate 4-lane
>> +		 * interface that can be configured as a single camera with 4
>> +		 * lanes or as a dual camera with 2 lanes available for each
>> +		 * camera.
>> +		 */
>> +		if (csi_chan->numlanes == 4) {
>> +			cil_write(csi, port_num + 1,
>> +				  TEGRA_CSI_CIL_STATUS, 0xffffffff);
>> +			cil_write(csi, port_num + 1,
>> +				  TEGRA_CSI_CILX_STATUS, 0xffffffff);
>> +			cil_write(csi, port_num + 1,
>> +				  TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +			cil_write(csi, port_num,
>> +				  TEGRA_CSI_CIL_PAD_CONFIG0, BRICK_CLOCK_A_4X);
>> +			cil_write(csi, port_num + 1,
>> +				  TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +			cil_write(csi, port_num + 1,
>> +				  TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +			cil_write(csi, port_num + 1,
>> +				  TEGRA_CSI_CIL_PHY_CONTROL, 0xa);
>> +			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE);
>> +		} else {
>> +			u32 val = ((port_num & 1) == PORT_A) ?
>> +				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_NOP :
>> +				  CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_NOP;
>> +			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  val);
>> +		}
>> +
>> +		/* CSI pixel parser registers setup */
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +			 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_RST);
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK,
>> +			 0x0);
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_CONTROL0,
>> +			 CSI_PP_PACKET_HEADER_SENT |
>> +			 CSI_PP_DATA_IDENTIFIER_ENABLE |
>> +			 CSI_PP_WORD_COUNT_SELECT_HEADER |
>> +			 CSI_PP_CRC_CHECK_ENABLE |  CSI_PP_WC_CHECK |
>> +			 CSI_PP_OUTPUT_FORMAT_STORE | CSI_PPA_PAD_LINE_NOPAD |
>> +			 CSI_PP_HEADER_EC_DISABLE | CSI_PPA_PAD_FRAME_NOPAD |
>> +			 (port_num & 1));
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_CONTROL1,
>> +			 (0x1 << CSI_PP_TOP_FIELD_FRAME_OFFSET) |
>> +			 (0x1 << CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET));
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_GAP,
>> +			 0x14 << PP_FRAME_MIN_GAP_OFFSET);
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME,
>> +			 0x0);
>> +		pp_write(csi, port_num, TEGRA_CSI_INPUT_STREAM_CONTROL,
>> +			 (0x3f << CSI_SKIP_PACKET_THRESHOLD_OFFSET) |
>> +			 (csi_chan->numlanes - 1));
>> +
>> +		/* TPG setup */
>> +		if (pg_mode) {
>> +			tpg_write(csi, port_num,
>> +				  TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +				  ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +				  PG_ENABLE);
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_BLANK,
>> +				  8 << PG_VBLANK_OFFSET | 512);
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_PHASE, 0x0);
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_RED_FREQ,
>> +				  (0x10 << PG_RED_VERT_INIT_FREQ_OFFSET) |
>> +				  (0x10 << PG_RED_HOR_INIT_FREQ_OFFSET));
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_RED_FREQ_RATE,
>> +				  0x0);
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_GREEN_FREQ,
>> +				  (0x10 << PG_GREEN_VERT_INIT_FREQ_OFFSET) |
>> +				  (0x10 << PG_GREEN_HOR_INIT_FREQ_OFFSET));
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_GREEN_FREQ_RATE,
>> +				  0x0);
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_BLUE_FREQ,
>> +				  (0x10 << PG_BLUE_VERT_INIT_FREQ_OFFSET) |
>> +				  (0x10 << PG_BLUE_HOR_INIT_FREQ_OFFSET));
>> +			tpg_write(csi, port_num, TEGRA_CSI_PG_BLUE_FREQ_RATE,
>> +				  0x0);
>> +		}
>> +
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +			 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_ENABLE);
>> +	} else {
>> +		u32 val = pp_read(csi, port_num,
>> +				  TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +
>> +		dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n",
>> +			val);
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_PARSER_STATUS, val);
>> +
>> +		val = cil_read(csi, port_num, TEGRA_CSI_CIL_STATUS);
>> +		dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +		cil_write(csi, port_num, TEGRA_CSI_CIL_STATUS, val);
>> +
>> +		val = cil_read(csi, port_num, TEGRA_CSI_CILX_STATUS);
>> +		dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +		cil_write(csi, port_num, TEGRA_CSI_CILX_STATUS, val);
>> +
>> +		pp_write(csi, port_num, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +			 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +			 CSI_PP_DISABLE);
>> +
>> +		if (pg_mode) {
>> +			tpg_write(csi, port_num,
>> +				  TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +				  PG_DISABLE);
>> +			return 0;
>> +		}
>> +
>> +		if (csi_chan->numlanes == 4) {
>> +			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  CSI_A_PHY_CIL_DISABLE |
>> +				  CSI_B_PHY_CIL_DISABLE);
>> +
>> +		} else {
>> +			u32 val = ((port_num & 1) == PORT_A) ?
>> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
>> +				  CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
>> +			csi_write(csi, port_num, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  val);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int tegra210_csi_hw_init(struct tegra_csi *csi)
>> +{
>> +	int ret;
>> +
>> +	csi->csi_clk = devm_clk_get(csi->dev, "csi");
>> +	if (IS_ERR(csi->csi_clk)) {
>> +		ret = PTR_ERR(csi->csi_clk);
>> +		dev_err(csi->dev, "failed to get csi clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	csi->tpg_clk = devm_clk_get(csi->dev, "csi_tpg");
>> +	if (IS_ERR(csi->tpg_clk)) {
>> +		ret = PTR_ERR(csi->tpg_clk);
>> +		dev_err(csi->dev, "failed to get csi_tpg clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	csi->cilab_clk = devm_clk_get(csi->dev, "cilab");
>> +	if (IS_ERR(csi->cilab_clk)) {
>> +		ret = PTR_ERR(csi->cilab_clk);
>> +		dev_err(csi->dev, "failed to get cilab clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	csi->cilcd_clk = devm_clk_get(csi->dev, "cilcd");
>> +	if (IS_ERR(csi->cilcd_clk)) {
>> +		ret = PTR_ERR(csi->cilcd_clk);
>> +		dev_err(csi->dev, "failed to get cilcd clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	csi->cilef_clk = devm_clk_get(csi->dev, "cile");
>> +	if (IS_ERR(csi->cilef_clk)) {
>> +		ret = PTR_ERR(csi->cilef_clk);
>> +		dev_err(csi->dev, "failed to get cile clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
> 
> devm_clk_bulk_get()?
> 
>> +	return 0;
>> +}
>> diff --git a/drivers/staging/media/tegra/tegra210.h b/drivers/staging/media/tegra/tegra210.h
>> new file mode 100644
>> index 0000000..c4548c5
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra210.h
>> @@ -0,0 +1,192 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __TEGRA210_H__
>> +#define __TEGRA210_H__
>> +
>> +/* Tegra210 VI registers */
>> +#define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
>> +#define TEGRA_VI_CFG_VI_INCR_SYNCPT			0x000
>> +#define   VI_CFG_VI_INCR_SYNCPT_COND(x)			(((x) & 0xff) << 8)
>> +#define   VI_CSI_PP_LINE_START(port)			(4 + (port) * 4)
>> +#define   VI_CSI_PP_FRAME_START(port)			(5 + (port) * 4)
>> +#define   VI_CSI_MW_REQ_DONE(port)			(6 + (port) * 4)
>> +#define   VI_CSI_MW_ACK_DONE(port)			(7 + (port) * 4)
>> +#define SYNCPT_FIFO_DEPTH				2
>> +
>> +#define TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL		0x004
>> +#define TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL		BIT(8)
>> +#define TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR		0x008
>> +#define TEGRA_VI_CFG_CTXSW				0x020
>> +#define TEGRA_VI_CFG_INTSTATUS				0x024
>> +#define TEGRA_VI_CFG_PWM_CONTROL			0x038
>> +#define TEGRA_VI_CFG_PWM_HIGH_PULSE			0x03c
>> +#define TEGRA_VI_CFG_PWM_LOW_PULSE			0x040
>> +#define TEGRA_VI_CFG_PWM_SELECT_PULSE_A			0x044
>> +#define TEGRA_VI_CFG_PWM_SELECT_PULSE_B			0x048
>> +#define TEGRA_VI_CFG_PWM_SELECT_PULSE_C			0x04c
>> +#define TEGRA_VI_CFG_PWM_SELECT_PULSE_D			0x050
>> +#define TEGRA_VI_CFG_VGP1				0x064
>> +#define TEGRA_VI_CFG_VGP2				0x068
>> +#define TEGRA_VI_CFG_VGP3				0x06c
>> +#define TEGRA_VI_CFG_VGP4				0x070
>> +#define TEGRA_VI_CFG_VGP5				0x074
>> +#define TEGRA_VI_CFG_VGP6				0x078
>> +#define TEGRA_VI_CFG_INTERRUPT_MASK			0x08c
>> +#define TEGRA_VI_CFG_INTERRUPT_TYPE_SELECT		0x090
>> +#define TEGRA_VI_CFG_INTERRUPT_POLARITY_SELECT		0x094
>> +#define TEGRA_VI_CFG_INTERRUPT_STATUS			0x098
>> +#define TEGRA_VI_CFG_VGP_SYNCPT_CONFIG			0x0ac
>> +#define TEGRA_VI_CFG_VI_SW_RESET			0x0b4
>> +#define TEGRA_VI_CFG_CG_CTRL				0x0b8
>> +#define   VI_CG_2ND_LEVEL_EN				0x1
>> +#define TEGRA_VI_CFG_VI_MCCIF_FIFOCTRL			0x0e4
>> +#define TEGRA_VI_CFG_TIMEOUT_WCOAL_VI			0x0e8
>> +#define TEGRA_VI_CFG_DVFS				0x0f0
>> +#define TEGRA_VI_CFG_RESERVE				0x0f4
>> +#define TEGRA_VI_CFG_RESERVE_1				0x0f8
>> +
>> +/* Tegra210 CSI registers */
>> +#define TEGRA_VI_CSI_SW_RESET				0x000
>> +#define TEGRA_VI_CSI_SINGLE_SHOT			0x004
>> +#define   SINGLE_SHOT_CAPTURE				0x1
>> +#define TEGRA_VI_CSI_SINGLE_SHOT_STATE_UPDATE		0x008
>> +#define TEGRA_VI_CSI_IMAGE_DEF				0x00c
>> +#define   BYPASS_PXL_TRANSFORM_OFFSET			24
>> +#define   IMAGE_DEF_FORMAT_OFFSET			16
>> +#define   IMAGE_DEF_DEST_MEM				0x1
>> +#define TEGRA_VI_CSI_RGB2Y_CTRL				0x010
>> +#define TEGRA_VI_CSI_MEM_TILING				0x014
>> +#define TEGRA_VI_CSI_IMAGE_SIZE				0x018
>> +#define   IMAGE_SIZE_HEIGHT_OFFSET			16
>> +#define TEGRA_VI_CSI_IMAGE_SIZE_WC			0x01c
>> +#define TEGRA_VI_CSI_IMAGE_DT				0x020
>> +#define TEGRA_VI_CSI_SURFACE0_OFFSET_MSB		0x024
>> +#define TEGRA_VI_CSI_SURFACE0_OFFSET_LSB		0x028
>> +#define TEGRA_VI_CSI_SURFACE1_OFFSET_MSB		0x02c
>> +#define TEGRA_VI_CSI_SURFACE1_OFFSET_LSB		0x030
>> +#define TEGRA_VI_CSI_SURFACE2_OFFSET_MSB		0x034
>> +#define TEGRA_VI_CSI_SURFACE2_OFFSET_LSB		0x038
>> +#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_MSB		0x03c
>> +#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_LSB		0x040
>> +#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_MSB		0x044
>> +#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_LSB		0x048
>> +#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_MSB		0x04c
>> +#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_LSB		0x050
>> +#define TEGRA_VI_CSI_SURFACE0_STRIDE			0x054
>> +#define TEGRA_VI_CSI_SURFACE1_STRIDE			0x058
>> +#define TEGRA_VI_CSI_SURFACE2_STRIDE			0x05c
>> +#define TEGRA_VI_CSI_SURFACE_HEIGHT0			0x060
>> +#define TEGRA_VI_CSI_ISPINTF_CONFIG			0x064
>> +#define TEGRA_VI_CSI_ERROR_STATUS			0x084
>> +#define TEGRA_VI_CSI_ERROR_INT_MASK			0x088
>> +#define TEGRA_VI_CSI_WD_CTRL				0x08c
>> +#define TEGRA_VI_CSI_WD_PERIOD				0x090
>> +
>> +/* Tegra210 CSI Pixel Parser registers: Starts from 0x838, offset 0x0 */
>> +#define TEGRA_CSI_INPUT_STREAM_CONTROL                  0x000
>> +#define   CSI_SKIP_PACKET_THRESHOLD_OFFSET		16
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0			0x004
>> +#define   CSI_PP_PACKET_HEADER_SENT			BIT(4)
>> +#define   CSI_PP_DATA_IDENTIFIER_ENABLE			BIT(5)
>> +#define   CSI_PP_WORD_COUNT_SELECT_HEADER		BIT(6)
>> +#define   CSI_PP_CRC_CHECK_ENABLE			BIT(7)
>> +#define   CSI_PP_WC_CHECK				BIT(8)
>> +#define   CSI_PP_OUTPUT_FORMAT_STORE			(0x3 << 16)
>> +#define   CSI_PPA_PAD_LINE_NOPAD			(0x2 << 24)
>> +#define   CSI_PP_HEADER_EC_DISABLE			(0x1 << 27)
>> +#define   CSI_PPA_PAD_FRAME_NOPAD			(0x2 << 28)
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1                 0x008
>> +#define   CSI_PP_TOP_FIELD_FRAME_OFFSET			0
>> +#define   CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET		4
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_GAP                      0x00c
>> +#define   PP_FRAME_MIN_GAP_OFFSET			16
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND               0x010
>> +#define   CSI_PP_ENABLE					0x1
>> +#define   CSI_PP_DISABLE				0x2
>> +#define   CSI_PP_RST					0x3
>> +#define   CSI_PP_SINGLE_SHOT_ENABLE			(0x1 << 2)
>> +#define   CSI_PP_START_MARKER_FRAME_MAX_OFFSET		12
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME           0x014
>> +#define TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK           0x018
>> +#define TEGRA_CSI_PIXEL_PARSER_STATUS                   0x01c
>> +#define TEGRA_CSI_CSI_SW_SENSOR_RESET                   0x020
>> +
>> +/* Tegra210 CSI PHY registers */
>> +/* CSI_PHY_CIL_COMMAND_0 offset 0x0d0 from TEGRA_CSI_PIXEL_PARSER_0_BASE */
>> +#define TEGRA_CSI_PHY_CIL_COMMAND                       0x0d0
>> +#define   CSI_A_PHY_CIL_NOP				0x0
>> +#define   CSI_A_PHY_CIL_ENABLE				0x1
>> +#define   CSI_A_PHY_CIL_DISABLE				0x2
>> +#define   CSI_A_PHY_CIL_ENABLE_MASK			0x3
>> +#define   CSI_B_PHY_CIL_NOP				(0x0 << 8)
>> +#define   CSI_B_PHY_CIL_ENABLE				(0x1 << 8)
>> +#define   CSI_B_PHY_CIL_DISABLE				(0x2 << 8)
>> +#define   CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 8)
>> +
>> +#define TEGRA_CSI_CIL_PAD_CONFIG0                       0x000
>> +#define   BRICK_CLOCK_A_4X				(0x1 << 16)
>> +#define   BRICK_CLOCK_B_4X				(0x2 << 16)
>> +#define TEGRA_CSI_CIL_PAD_CONFIG1                       0x004
>> +#define TEGRA_CSI_CIL_PHY_CONTROL                       0x008
>> +#define TEGRA_CSI_CIL_INTERRUPT_MASK                    0x00c
>> +#define TEGRA_CSI_CIL_STATUS                            0x010
>> +#define TEGRA_CSI_CILX_STATUS                           0x014
>> +#define TEGRA_CSI_CIL_ESCAPE_MODE_COMMAND               0x018
>> +#define TEGRA_CSI_CIL_ESCAPE_MODE_DATA                  0x01c
>> +#define TEGRA_CSI_CIL_SW_SENSOR_RESET                   0x020
>> +
>> +#define TEGRA_CSI_PATTERN_GENERATOR_CTRL		0x000
>> +#define   PG_MODE_OFFSET				2
>> +#define   PG_ENABLE					0x1
>> +#define   PG_DISABLE					0x0
>> +
>> +#define PG_VBLANK_OFFSET				16
>> +#define TEGRA_CSI_PG_BLANK				0x004
>> +#define TEGRA_CSI_PG_PHASE				0x008
>> +#define TEGRA_CSI_PG_RED_FREQ				0x00c
>> +#define   PG_RED_VERT_INIT_FREQ_OFFSET			16
>> +#define   PG_RED_HOR_INIT_FREQ_OFFSET			0
>> +
>> +#define TEGRA_CSI_PG_RED_FREQ_RATE			0x010
>> +#define TEGRA_CSI_PG_GREEN_FREQ				0x014
>> +#define   PG_GREEN_VERT_INIT_FREQ_OFFSET		16
>> +#define   PG_GREEN_HOR_INIT_FREQ_OFFSET			0
>> +
>> +#define TEGRA_CSI_PG_GREEN_FREQ_RATE			0x018
>> +#define TEGRA_CSI_PG_BLUE_FREQ				0x01c
>> +#define   PG_BLUE_VERT_INIT_FREQ_OFFSET			16
>> +#define   PG_BLUE_HOR_INIT_FREQ_OFFSET			0
>> +
>> +#define TEGRA_CSI_PG_BLUE_FREQ_RATE			0x020
>> +#define TEGRA_CSI_PG_AOHDR				0x024
>> +
>> +#define TEGRA_CSI_DPCM_CTRL_A				0xa2c
>> +#define TEGRA_CSI_DPCM_CTRL_B				0xa30
>> +
>> +/* Other CSI registers: Starts from 0xa44, offset 0x20c */
>> +#define TEGRA_CSI_STALL_COUNTER				0x20c
>> +#define TEGRA_CSI_CSI_READONLY_STATUS			0x210
>> +#define TEGRA_CSI_CSI_SW_STATUS_RESET			0x214
>> +#define TEGRA_CSI_CLKEN_OVERRIDE			0x218
>> +#define TEGRA_CSI_DEBUG_CONTROL				0x21c
>> +#define TEGRA_CSI_DEBUG_COUNTER_0			0x220
>> +#define TEGRA_CSI_DEBUG_COUNTER_1			0x224
>> +#define TEGRA_CSI_DEBUG_COUNTER_2			0x228
>> +
>> +/* Tegra210 CSI Pixel Parser registers */
>> +#define TEGRA_CSI_PIXEL_PARSER_0_BASE			0x0838
>> +#define TEGRA_CSI_PIXEL_PARSER_1_BASE			0x086c
>> +#define TEGRA_CSI_PIXEL_PARSER_2_BASE			0x1038
>> +#define TEGRA_CSI_PIXEL_PARSER_3_BASE			0x106c
>> +#define TEGRA_CSI_PIXEL_PARSER_4_BASE			0x1838
>> +#define TEGRA_CSI_PIXEL_PARSER_5_BASE			0x186c
>> +
>> +#endif
> 

