Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D752820720A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 13:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390564AbgFXL2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 07:28:46 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56257 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389030AbgFXL2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 07:28:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o3Zxjtoj2x3Ajo3a0jjB79; Wed, 24 Jun 2020 13:28:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592998117; bh=WbsT70AB3Kub9M3fFgxN2PajNmvnWylFQJm+GUUvAyM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dF+1VLTjf6S3ki8KdRpRsVuyVb/bC8ZCqRALgfpdHUdNoMVy6gFjqsBCv/a+gs3Jy
         Gg/Srki/bpWY6Jr7I8hoQ8X6eukueVLaCPjgXbe4kR3CJctc55Fx4O5WZcj8ft+cLI
         1UH/cUjYb0e/M+I/ZMJvfjvatrWDbs7dayDGQgB2pPYSINjWy63rBnfCuUM/re9Q47
         m+8/DPhpsbsLACVSMn1xDO7Hb9MREG9Pj58+8+KM4j1mnsoVcOgmqyMWOFQp5FasA8
         rUQM3UZhxz7sCvnivVsic4BqyqpCTBbONXg1w+mrtMRITKlmt0XQpmPOChDrxZrvFq
         CROkuFESqgYtQ==
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835 ISP
To:     Naushir Patuck <naush@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-34-laurent.pinchart@ideasonboard.com>
 <3de6ce28-1089-19c2-cdac-64796a46638f@xs4all.nl>
 <CAEmqJPo-ST8msiQVedLmH48vsMBz2WeaK6WXyN5fiP5z1b+wAA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <88e0e7f1-5ddd-5525-ddad-cfdb42608bc3@xs4all.nl>
Date:   Wed, 24 Jun 2020 13:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAEmqJPo-ST8msiQVedLmH48vsMBz2WeaK6WXyN5fiP5z1b+wAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIkaLlVRQcvi5iJiQcZsXuf1Sw6Tv/OqkA9K+JzLXiVSLobApe76YBv8oxGs5fbzUD8ciCSUkip49f7jkMoSbMP1fRZwLuVtvQX4+5d6aSiRFRlYf5+N
 +m7iCkvLjzhsuLHBCwfiu2gqb3WqvWJRnkxQoy7VgaWf8MF6g7z0Z2OlY98Fk9aG9bUDgt9UYL6IgHvOImn2iAC0Y+lXQYPZZtJveQC3kMrQ1GZ45lwLUa9h
 DiNp3DRDbIxYTjLMSFTHZlyCBo+1ZKisidpy1W2Dohwj+EMYKkS62NaSp8d2V1zeeFdlNt5UiNrVFb5+GxY5RfW7yWXoaYypcfqPtxbGAQpBNyt5e4wjZds4
 ZdguhtrN7hAWQwN+BnNtZNEKQdV7119huJUs4/dV7ldjUc1b7BRgVIOb/385beeXATGTDr7e
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2020 14:47, Naushir Patuck wrote:
> Hi Hans,
> 
> Thank you for the review and comments.  Just a follow up and
> overlapping Dave's comments:
> 
> On Mon, 18 May 2020 at 13:02, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 04/05/2020 11:26, Laurent Pinchart wrote:
>>> From: Naushir Patuck <naush@raspberrypi.com>
>>>
>>> Port the V4L2 compatible driver for the ISP unit found on Broadcom BCM2835
>>> chips.
>>>
>>> The driver interfaces though the VideoCore unit using the VCHIQ MMAL
>>> interface.
>>>
>>> ISP driver upported from from RaspberryPi BSP at revision:
>>> 6c3505be6c3e ("staging: vc04_services: isp: Make all references to bcm2835_isp_fmt const")
>>>
>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>> [Adapt to staging by moving all modifications that in the BSP are scattered
>>> in core components inside this directory]
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  .../v4l/pixfmt-meta-bcm2835-isp-stats.rst     |   41 +
>>>  drivers/staging/vc04_services/Kconfig         |    2 +
>>>  drivers/staging/vc04_services/Makefile        |    1 +
>>>  .../staging/vc04_services/bcm2835-isp/Kconfig |   14 +
>>>  .../vc04_services/bcm2835-isp/Makefile        |   10 +
>>>  .../bcm2835-isp/bcm2835-v4l2-isp.c            | 1632 +++++++++++++++++
>>>  .../bcm2835-isp/bcm2835_isp_ctrls.h           |   67 +
>>>  .../bcm2835-isp/bcm2835_isp_fmts.h            |  301 +++
>>>  .../include/uapi/linux/bcm2835-isp.h          |  333 ++++
>>>  .../staging/vc04_services/vchiq-mmal/Kconfig  |    3 +-
>>>  .../vc04_services/vchiq-mmal/mmal-encodings.h |    4 +
>>>  .../vchiq-mmal/mmal-parameters.h              |  153 +-
>>>  12 files changed, 2559 insertions(+), 2 deletions(-)
>>>  create mode 100644 drivers/staging/vc04_services/Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>>>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Kconfig
>>>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Makefile
>>>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
>>>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrls.h
>>>  create mode 100644 drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts.h
>>>  create mode 100644 drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h
>>>
>>
>> <snip>
>>
>>> diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
>>> new file mode 100644
>>> index 000000000000..a32faab4b8dc
>>> --- /dev/null
>>> +++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
>>> @@ -0,0 +1,1632 @@
>>

<snip>

>>
>>> +             break;
>>> +     }
>>> +
>>> +     /* We use the selection API instead of the old crop API. */
>>> +     v4l2_disable_ioctl(vfd, VIDIOC_CROPCAP);
>>> +     v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
>>> +     v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
>>
>> No need for this: the core handles this and will disable these ioctls
>> automatically.
> 
> Without these explicitally disabled, we fail v4l2-compliance on the
> video capture nodes with the following error:
> Format ioctls:
>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>     test VIDIOC_G/S_PARM: OK (Not Supported)
>     test VIDIOC_G_FBUF: OK (Not Supported)
>     test VIDIOC_G_FMT: OK
>     test VIDIOC_TRY_FMT: OK
>     test VIDIOC_S_FMT: OK
>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>     fail: v4l2-test-formats.cpp(1510): doioctl(node, VIDIOC_G_SELECTION, &sel)

I believe that's because G_SELECTION doesn't support the V4L2_SEL_TGT_CROP_DEFAULT
target. Once that is supported, this test should pass.

Regards,

	Hans

>     fail: v4l2-test-formats.cpp(1550): testLegacyCrop(node)
>     test Cropping: FAIL
>     test Composing: OK (Not Supported)
>     test Scaling: OK (Not Supported)
> 
>>
>>> +
>>> +     ret = bcm2835_isp_get_supported_fmts(node);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Initialise the the video node. */
>>> +     vfd->vfl_type   = VFL_TYPE_VIDEO;
>>> +     vfd->fops       = &bcm2835_isp_fops,
>>> +     vfd->ioctl_ops  = &bcm2835_isp_node_ioctl_ops,
>>> +     vfd->minor      = -1,
>>> +     vfd->release    = video_device_release_empty,
>>> +     vfd->queue      = &node->queue;
>>> +     vfd->lock       = &node->lock;
>>> +     vfd->v4l2_dev   = &dev->v4l2_dev;
>>> +     vfd->vfl_dir    = node->vfl_dir;
>>> +
>>> +     node->q_data.fmt = get_default_format(node);
>>> +     node->q_data.width = DEFAULT_DIM;
>>> +     node->q_data.height = DEFAULT_DIM;
>>> +     node->q_data.bytesperline =
>>> +             get_bytesperline(DEFAULT_DIM, node->q_data.fmt);
>>> +     node->q_data.sizeimage = node_is_stats(node) ?
>>> +                              get_port_data(node)->recommended_buffer.size :
>>> +                              get_sizeimage(node->q_data.bytesperline,
>>> +                                            node->q_data.width,
>>> +                                            node->q_data.height,
>>> +                                            node->q_data.fmt);
>>> +
>>> +     queue->io_modes = VB2_MMAP | VB2_DMABUF;
>>> +     queue->drv_priv = node;
>>> +     queue->ops = &bcm2835_isp_node_queue_ops;
>>> +     queue->mem_ops = &vb2_dma_contig_memops;
>>> +     queue->buf_struct_size = sizeof(struct bcm2835_isp_buffer);
>>> +     queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>> +     queue->dev = dev->dev;
>>> +     queue->lock = &node->queue_lock;
>>> +
>>> +     ret = vb2_queue_init(queue);
>>> +     if (ret < 0) {
>>> +             v4l2_info(&dev->v4l2_dev, "vb2_queue_init failed\n");
>>> +             return ret;
>>> +     }
>>> +     node->queue_init = true;
>>> +
>>> +     /* Define the device names */
>>> +     snprintf(vfd->name, sizeof(node->vfd.name), "%s-%s%d", BCM2835_ISP_NAME,
>>> +              node->name, node->id);
>>> +
>>> +     ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr + index);
>>> +     if (ret) {
>>> +             v4l2_err(&dev->v4l2_dev,
>>> +                      "Failed to register video %s[%d] device node\n",
>>> +                      node->name, node->id);
>>> +             return ret;
>>> +     }
>>
>> Move registering the video device to the end of this function.
>> Otherwise the output video device would be created (and available for
>> userspace) before the controls are added.
>>
> 
> Ack
> 
>>> +
>>> +     node->registered = true;
>>> +     video_set_drvdata(vfd, node);
>>> +
>>> +     /* Set some controls and defaults, but only on the VIDEO_OUTPUT node. */
>>> +     if (node_is_output(node)) {
>>> +             unsigned int i;
>>> +
>>> +             /* Use this ctrl template to assign all out ISP custom ctrls. */
>>> +             struct v4l2_ctrl_config ctrl_template = {
>>> +                     .ops            = &bcm2835_isp_ctrl_ops,
>>> +                     .type           = V4L2_CTRL_TYPE_U8,
>>> +                     .def            = 0,
>>> +                     .min            = 0x00,
>>> +                     .max            = 0xff,
>>> +                     .step           = 1,
>>> +             };
>>> +
>>> +             v4l2_ctrl_handler_init(&dev->ctrl_handler, 4);
>>> +
>>> +             dev->r_gain = 1000;
>>> +             dev->b_gain = 1000;
>>> +
>>> +             v4l2_ctrl_new_std(&dev->ctrl_handler,  &bcm2835_isp_ctrl_ops,
>>> +                               V4L2_CID_RED_BALANCE, 1, 0xffff, 1,
>>> +                               dev->r_gain);
>>> +
>>> +             v4l2_ctrl_new_std(&dev->ctrl_handler, &bcm2835_isp_ctrl_ops,
>>> +                               V4L2_CID_BLUE_BALANCE, 1, 0xffff, 1,
>>> +                               dev->b_gain);
>>> +
>>> +             v4l2_ctrl_new_std(&dev->ctrl_handler, &bcm2835_isp_ctrl_ops,
>>> +                               V4L2_CID_DIGITAL_GAIN, 1, 0xffff, 1, 1000);
>>> +
>>> +             for (i = 0; i < ARRAY_SIZE(custom_ctrls); i++) {
>>> +                     ctrl_template.name = custom_ctrls[i].name;
>>> +                     ctrl_template.id = custom_ctrls[i].id;
>>> +                     ctrl_template.dims[0] = custom_ctrls[i].size;
>>> +                     ctrl_template.flags = custom_ctrls[i].flags;
>>> +                     v4l2_ctrl_new_custom(&dev->ctrl_handler,
>>> +                                          &ctrl_template, NULL);
>>> +             }
>>> +
>>> +             node->vfd.ctrl_handler = &dev->ctrl_handler;
>>
>> Missing error check.
> 
> Ack
> 
>>
>>> +     }
>>> +
>>> +     v4l2_info(&dev->v4l2_dev,
>>> +               "Device node %s[%d] registered as /dev/video%d\n",
>>> +               node->name, node->id, vfd->num);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/* Unregister one of the /dev/video<N> nodes associated with the ISP. */
>>> +static void unregister_node(struct bcm2835_isp_node *node)
>>> +{
>>> +     struct bcm2835_isp_dev *dev = node_get_dev(node);
>>> +
>>> +     v4l2_info(&dev->v4l2_dev,
>>> +               "Unregistering node %s[%d] device node /dev/video%d\n",
>>> +               node->name, node->id, node->vfd.num);
>>> +
>>> +     if (node->queue_init)
>>> +             vb2_queue_release(&node->queue);
>>> +
>>> +     if (node->registered) {
>>> +             video_unregister_device(&node->vfd);
>>> +             if (node_is_output(node))
>>> +                     v4l2_ctrl_handler_free(&dev->ctrl_handler);
>>> +     }
>>> +
>>> +     /*
>>> +      * node->supported_fmts.list is free'd automatically
>>> +      * as a managed resource.
>>> +      */
>>> +     node->supported_fmts.list = NULL;
>>> +     node->supported_fmts.num_entries = 0;
>>> +     node->vfd.ctrl_handler = NULL;
>>> +     node->registered = false;
>>> +     node->queue_init = false;
>>> +}
>>> +
>>> +static void media_controller_unregister(struct bcm2835_isp_dev *dev)
>>> +{
>>> +     unsigned int i;
>>> +
>>> +     v4l2_info(&dev->v4l2_dev, "Unregister from media controller\n");
>>> +
>>> +     if (dev->media_device_registered) {
>>> +             media_device_unregister(&dev->mdev);
>>> +             media_device_cleanup(&dev->mdev);
>>> +             dev->media_device_registered = false;
>>> +     }
>>> +
>>> +     kfree(dev->entity.name);
>>> +     dev->entity.name = NULL;
>>> +
>>> +     if (dev->media_entity_registered) {
>>> +             media_device_unregister_entity(&dev->entity);
>>> +             dev->media_entity_registered = false;
>>> +     }
>>> +
>>> +     for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
>>> +             struct bcm2835_isp_node *node = &dev->node[i];
>>> +
>>> +             if (node->media_node_registered) {
>>> +                     media_remove_intf_links(node->intf_link->intf);
>>> +                     media_entity_remove_links(&dev->node[i].vfd.entity);
>>> +                     media_devnode_remove(node->intf_devnode);
>>> +                     media_device_unregister_entity(&node->vfd.entity);
>>> +                     kfree(node->vfd.entity.name);
>>> +             }
>>> +             node->media_node_registered = false;
>>> +     }
>>> +
>>> +     dev->v4l2_dev.mdev = NULL;
>>> +}
>>> +
>>> +static int media_controller_register_node(struct bcm2835_isp_dev *dev, int num)
>>> +{
>>> +     struct bcm2835_isp_node *node = &dev->node[num];
>>> +     struct media_entity *entity = &node->vfd.entity;
>>> +     int output = node_is_output(node);
>>> +     char *name;
>>> +     int ret;
>>> +
>>> +     v4l2_info(&dev->v4l2_dev,
>>> +               "Register %s node %d with media controller\n",
>>> +               output ? "output" : "capture", num);
>>> +     entity->obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
>>> +     entity->function = MEDIA_ENT_F_IO_V4L;
>>> +     entity->info.dev.major = VIDEO_MAJOR;
>>> +     entity->info.dev.minor = node->vfd.minor;
>>> +     name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
>>> +     if (!name) {
>>> +             ret = -ENOMEM;
>>> +             goto error_no_mem;
>>> +     }
>>> +     snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "%s0-%s%d",
>>> +              BCM2835_ISP_NAME, output ? "output" : "capture", num);
>>> +     entity->name = name;
>>> +     node->pad.flags = output ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
>>> +     ret = media_entity_pads_init(entity, 1, &node->pad);
>>> +     if (ret)
>>> +             goto error_pads_init;
>>> +     ret = media_device_register_entity(&dev->mdev, entity);
>>> +     if (ret)
>>> +             goto error_register_entity;
>>> +
>>> +     node->intf_devnode = media_devnode_create(&dev->mdev,
>>> +                                               MEDIA_INTF_T_V4L_VIDEO, 0,
>>> +                                               VIDEO_MAJOR, node->vfd.minor);
>>> +     if (!node->intf_devnode) {
>>> +             ret = -ENOMEM;
>>> +             goto error_devnode_create;
>>> +     }
>>> +
>>> +     node->intf_link = media_create_intf_link(entity,
>>> +                                              &node->intf_devnode->intf,
>>> +                                              MEDIA_LNK_FL_IMMUTABLE |
>>> +                                              MEDIA_LNK_FL_ENABLED);
>>> +     if (!node->intf_link) {
>>> +             ret = -ENOMEM;
>>> +             goto error_create_intf_link;
>>> +     }
>>> +
>>> +     if (output)
>>> +             ret = media_create_pad_link(entity, 0, &dev->entity, num,
>>> +                                         MEDIA_LNK_FL_IMMUTABLE |
>>> +                                                 MEDIA_LNK_FL_ENABLED);
>>> +     else
>>> +             ret = media_create_pad_link(&dev->entity, num, entity, 0,
>>> +                                         MEDIA_LNK_FL_IMMUTABLE |
>>> +                                         MEDIA_LNK_FL_ENABLED);
>>> +     if (ret)
>>> +             goto error_create_pad_link;
>>> +
>>> +     dev->node[num].media_node_registered = true;
>>> +     return 0;
>>> +
>>> +error_create_pad_link:
>>> +     media_remove_intf_links(&node->intf_devnode->intf);
>>> +error_create_intf_link:
>>> +     media_devnode_remove(node->intf_devnode);
>>> +error_devnode_create:
>>> +     media_device_unregister_entity(&node->vfd.entity);
>>> +error_register_entity:
>>> +error_pads_init:
>>> +     kfree(entity->name);
>>> +     entity->name = NULL;
>>> +error_no_mem:
>>> +     if (ret)
>>> +             v4l2_info(&dev->v4l2_dev, "Error registering node\n");
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int media_controller_register(struct bcm2835_isp_dev *dev)
>>> +{
>>> +     char *name;
>>> +     unsigned int i;
>>> +     int ret;
>>> +
>>> +     v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media controller\n");
>>> +     dev->mdev.dev = dev->dev;
>>> +     strscpy(dev->mdev.model, "bcm2835-isp",
>>> +             sizeof(dev->mdev.model));
>>> +     strscpy(dev->mdev.bus_info, "platform:bcm2835-isp",
>>> +             sizeof(dev->mdev.bus_info));
>>> +     media_device_init(&dev->mdev);
>>> +     dev->v4l2_dev.mdev = &dev->mdev;
>>> +
>>> +     v4l2_dbg(2, debug, &dev->v4l2_dev, "Register entity for nodes\n");
>>> +
>>> +     name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
>>> +     if (!name) {
>>> +             ret = -ENOMEM;
>>> +             goto done;
>>> +     }
>>> +     snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835_isp0");
>>> +     dev->entity.name = name;
>>> +     dev->entity.obj_type = MEDIA_ENTITY_TYPE_BASE;
>>> +     dev->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
>>> +
>>> +     for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
>>> +             dev->pad[i].flags = node_is_output(&dev->node[i]) ?
>>> +                                     MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
>>> +     }
>>> +
>>> +     ret = media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_NODES,
>>> +                                  dev->pad);
>>> +     if (ret)
>>> +             goto done;
>>> +
>>> +     ret = media_device_register_entity(&dev->mdev, &dev->entity);
>>> +     if (ret)
>>> +             goto done;
>>> +
>>> +     dev->media_entity_registered = true;
>>> +     for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
>>> +             ret = media_controller_register_node(dev, i);
>>> +             if (ret)
>>> +                     goto done;
>>> +     }
>>> +
>>> +     ret = media_device_register(&dev->mdev);
>>> +     if (!ret)
>>> +             dev->media_device_registered = true;
>>> +done:
>>> +     return ret;
>>> +}
>>> +
>>> +static int bcm2835_isp_remove(struct platform_device *pdev)
>>> +{
>>> +     struct bcm2835_isp_dev *dev = platform_get_drvdata(pdev);
>>> +     unsigned int i;
>>> +
>>> +     media_controller_unregister(dev);
>>> +
>>> +     for (i = 0; i < BCM2835_ISP_NUM_NODES; i++)
>>> +             unregister_node(&dev->node[i]);
>>> +
>>> +     v4l2_device_unregister(&dev->v4l2_dev);
>>> +
>>> +     if (dev->component)
>>> +             vchiq_mmal_component_finalise(dev->mmal_instance,
>>> +                                           dev->component);
>>> +
>>> +     vchiq_mmal_finalise(dev->mmal_instance);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int bcm2835_isp_probe(struct platform_device *pdev)
>>> +{
>>> +     struct bcm2835_isp_dev *dev;
>>> +     unsigned int i;
>>> +     int ret;
>>> +
>>> +     dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>>> +     if (!dev)
>>> +             return -ENOMEM;
>>> +
>>> +     dev->dev = &pdev->dev;
>>> +
>>> +     ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = vchiq_mmal_init(&dev->mmal_instance);
>>> +     if (ret) {
>>> +             v4l2_device_unregister(&dev->v4l2_dev);
>>> +             return ret;
>>> +     }
>>> +
>>> +     ret = vchiq_mmal_component_init(dev->mmal_instance, "ril.isp",
>>> +                                     &dev->component);
>>> +     if (ret) {
>>> +             v4l2_err(&dev->v4l2_dev,
>>> +                      "%s: failed to create ril.isp component\n", __func__);
>>> +             goto error;
>>> +     }
>>> +
>>> +     if ((dev->component->inputs != BCM2835_ISP_NUM_OUTPUTS) ||
>>> +         (dev->component->outputs != BCM2835_ISP_NUM_CAPTURES +
>>> +                                     BCM2835_ISP_NUM_METADATA)) {
>>> +             v4l2_err(&dev->v4l2_dev,
>>> +                      "%s: ril.isp returned %d i/p (%d expected), %d o/p (%d expected) ports\n",
>>> +                       __func__, dev->component->inputs,
>>> +                       BCM2835_ISP_NUM_OUTPUTS,
>>> +                       dev->component->outputs,
>>> +                       BCM2835_ISP_NUM_CAPTURES + BCM2835_ISP_NUM_METADATA);
>>> +             goto error;
>>> +     }
>>> +
>>> +     atomic_set(&dev->num_streaming, 0);
>>> +
>>> +     for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
>>> +             struct bcm2835_isp_node *node = &dev->node[i];
>>> +
>>> +             ret = register_node(dev, node, i);
>>> +             if (ret)
>>> +                     goto error;
>>> +     }
>>> +
>>> +     ret = media_controller_register(dev);
>>> +     if (ret)
>>> +             goto error;
>>> +
>>> +     platform_set_drvdata(pdev, dev);
>>> +     v4l2_info(&dev->v4l2_dev, "Loaded V4L2 %s\n", BCM2835_ISP_NAME);
>>> +     return 0;
>>> +
>>> +error:
>>> +     bcm2835_isp_remove(pdev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static struct platform_driver bcm2835_isp_pdrv = {
>>> +     .probe = bcm2835_isp_probe,
>>> +     .remove = bcm2835_isp_remove,
>>> +     .driver = {
>>> +                     .name = BCM2835_ISP_NAME,
>>> +               },
>>> +};
>>> +
>>> +module_platform_driver(bcm2835_isp_pdrv);
>>> +
>>> +MODULE_DESCRIPTION("BCM2835 ISP driver");
>>> +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_VERSION("1.0");
>>> +MODULE_ALIAS("platform:bcm2835-isp");
>>> diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrls.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrls.h
>>> new file mode 100644
>>> index 000000000000..cfbb1063aad1
>>> --- /dev/null
>>> +++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_ctrls.h
>>> @@ -0,0 +1,67 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Broadcom BCM2835 ISP driver
>>> + *
>>> + * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
>>> + *
>>> + * Author: Naushir Patuck (naush@raspberrypi.com)
>>> + *
>>> + */
>>> +
>>> +#ifndef BCM2835_ISP_CTRLS
>>> +#define BCM2835_ISP_CTRLS
>>> +
>>> +#include <linux/bcm2835-isp.h>
>>> +
>>> +struct bcm2835_isp_custom_ctrl {
>>> +     const char *name;
>>> +     u32 id;
>>> +     u32 size;
>>> +     u32 flags;
>>> +};
>>> +
>>> +static const struct bcm2835_isp_custom_ctrl custom_ctrls[] = {
>>> +     {
>>> +             .name   = "Colour Correction Matrix",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_CC_MATRIX,
>>> +             .size   = sizeof(struct bcm2835_isp_custom_ccm),
>>> +             .flags  = 0
>>> +     }, {
>>> +             .name   = "Lens Shading",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_LENS_SHADING,
>>> +             .size   = sizeof(struct bcm2835_isp_lens_shading),
>>> +             .flags  = V4L2_CTRL_FLAG_EXECUTE_ON_WRITE
>>> +     }, {
>>> +             .name   = "Black Level",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL,
>>> +             .size   = sizeof(struct bcm2835_isp_black_level),
>>> +             .flags  = 0
>>> +     }, {
>>> +             .name   = "Green Equalisation",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_GEQ,
>>> +             .size   = sizeof(struct bcm2835_isp_geq),
>>> +             .flags  = 0
>>> +     }, {
>>> +             .name   = "Gamma",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_GAMMA,
>>> +             .size   = sizeof(struct bcm2835_isp_gamma),
>>> +             .flags  = 0
>>> +     }, {
>>> +             .name   = "Sharpen",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_SHARPEN,
>>> +             .size   = sizeof(struct bcm2835_isp_sharpen),
>>> +             .flags  = 0
>>> +     }, {
>>> +             .name   = "Denoise",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_DENOISE,
>>> +             .size   = sizeof(struct bcm2835_isp_denoise),
>>> +             .flags  = 0
>>> +     }, {
>>> +             .name   = "Defective Pixel Correction",
>>> +             .id     = V4L2_CID_USER_BCM2835_ISP_DPC,
>>> +             .size   = sizeof(struct bcm2835_isp_dpc),
>>> +             .flags  = 0
>>> +     }
>>> +};
>>> +
>>> +#endif
>>> diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts.h
>>> new file mode 100644
>>> index 000000000000..af3bde152bb2
>>> --- /dev/null
>>> +++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835_isp_fmts.h
>>> @@ -0,0 +1,301 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Broadcom BCM2835 ISP driver
>>> + *
>>> + * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
>>> + *
>>> + * Author: Naushir Patuck (naush@raspberrypi.com)
>>> + *
>>> + */
>>> +
>>> +#ifndef BCM2835_ISP_FMTS
>>> +#define BCM2835_ISP_FMTS
>>> +
>>> +#include <linux/videodev2.h>
>>> +#include "vchiq-mmal/mmal-encodings.h"
>>> +
>>> +struct bcm2835_isp_fmt {
>>> +     u32 fourcc;
>>> +     int depth;
>>> +     int bytesperline_align;
>>> +     u32 flags;
>>> +     u32 mmal_fmt;
>>> +     int size_multiplier_x2;
>>> +     enum v4l2_colorspace colorspace;
>>> +     unsigned int step_size;
>>> +};
>>> +
>>> +struct bcm2835_isp_fmt_list {
>>> +     struct bcm2835_isp_fmt const **list;
>>> +     unsigned int num_entries;
>>> +};
>>> +
>>> +static const struct bcm2835_isp_fmt supported_formats[] = {
>>> +     {
>>> +             /* YUV formats */
>>> +             .fourcc             = V4L2_PIX_FMT_YUV420,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_I420,
>>> +             .size_multiplier_x2 = 3,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_YVU420,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_YV12,
>>> +             .size_multiplier_x2 = 3,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_NV12,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_NV12,
>>> +             .size_multiplier_x2 = 3,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_NV21,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_NV21,
>>> +             .size_multiplier_x2 = 3,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_YUYV,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_YUYV,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_UYVY,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_UYVY,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_YVYU,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_YVYU,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_VYUY,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_VYUY,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SMPTE170M,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             /* RGB formats */
>>> +             .fourcc             = V4L2_PIX_FMT_RGB24,
>>> +             .depth              = 24,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_RGB24,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SRGB,
>>> +             .step_size          = 1,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_RGB565,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_RGB16,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SRGB,
>>> +             .step_size          = 1,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_BGR24,
>>> +             .depth              = 24,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BGR24,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SRGB,
>>> +             .step_size          = 1,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_ABGR32,
>>> +             .depth              = 32,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BGRA,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_SRGB,
>>> +             .step_size          = 1,
>>> +     }, {
>>> +             /* Bayer formats */
>>> +             /* 8 bit */
>>> +             .fourcc             = V4L2_PIX_FMT_SRGGB8,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SRGGB8,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SBGGR8,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SBGGR8,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGRBG8,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGRBG8,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGBRG8,
>>> +             .depth              = 8,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGBRG8,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             /* 10 bit */
>>> +             .fourcc             = V4L2_PIX_FMT_SRGGB10P,
>>> +             .depth              = 10,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SRGGB10P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SBGGR10P,
>>> +             .depth              = 10,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SBGGR10P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGRBG10P,
>>> +             .depth              = 10,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGRBG10P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGBRG10P,
>>> +             .depth              = 10,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGBRG10P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             /* 12 bit */
>>> +             .fourcc             = V4L2_PIX_FMT_SRGGB12P,
>>> +             .depth              = 12,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SRGGB12P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SBGGR12P,
>>> +             .depth              = 12,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SBGGR12P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGRBG12P,
>>> +             .depth              = 12,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGRBG12P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGBRG12P,
>>> +             .depth              = 12,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGBRG12P,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             /* 16 bit */
>>> +             .fourcc             = V4L2_PIX_FMT_SRGGB16,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SRGGB16,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SBGGR16,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SBGGR16,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGRBG16,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGRBG16,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             .fourcc             = V4L2_PIX_FMT_SGBRG16,
>>> +             .depth              = 16,
>>> +             .bytesperline_align = 32,
>>> +             .flags              = 0,
>>> +             .mmal_fmt           = MMAL_ENCODING_BAYER_SGBRG16,
>>> +             .size_multiplier_x2 = 2,
>>> +             .colorspace         = V4L2_COLORSPACE_RAW,
>>> +             .step_size          = 2,
>>> +     }, {
>>> +             /* ISP statistics format */
>>> +             .fourcc             = V4L2_META_FMT_BCM2835_ISP_STATS,
>>> +             .mmal_fmt           = MMAL_ENCODING_BRCM_STATS,
>>> +             /* The rest are not valid fields for stats. */
>>> +     }
>>> +};
>>> +
>>> +#endif
>>> diff --git a/drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h b/drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h
>>> new file mode 100644
>>> index 000000000000..edc452fa8318
>>> --- /dev/null
>>> +++ b/drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h
>>> @@ -0,0 +1,333 @@
>>> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
>>> +/*
>>> + * bcm2835-isp.h
>>> + *
>>> + * BCM2835 ISP driver - user space header file.
>>> + *
>>> + * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
>>> + *
>>> + * Author: Naushir Patuck (naush@raspberrypi.com)
>>> + *
>>> + */
>>> +
>>> +#ifndef __BCM2835_ISP_H_
>>> +#define __BCM2835_ISP_H_
>>> +
>>> +#include <linux/v4l2-controls.h>
>>> +
>>> +/* TODO: move the control IDs definitions to v4l2-controls.h */
>>> +#define V4L2_CID_USER_BCM2835_ISP_BASE         (V4L2_CID_USER_BASE + 0x10c0)
>>
>> As the TODO says: move this to v4l2-controls.h. Currently the 0x10c0 offset
>> clashes with V4L2_CID_USER_ATMEL_ISC_BASE, so that certainly should be fixed.
>>
> 
> Unfortunately, there seems to be a mixup here.  Laurent, we have
> accidentally mailed a WIP revision of this patch.  The final version
> does have V4L2_CID_USER_BCM2835_ISP_BASE with a unique id in
> v4l2-controls.h.  I will talk with Laurent separately to get the
> correct revison included in the next patch-set.
> 
>>> +
>>> +/* TODO: move the formats definitions to videodev2.h */
>>> +/* 12  Y/CbCr 4:2:0 128 pixel wide column */
>>> +#define V4L2_PIX_FMT_NV12_COL128 v4l2_fourcc('N', 'C', '1', '2')
>>> +/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pixel wide column */
>>> +#define V4L2_PIX_FMT_NV12_10_COL128 v4l2_fourcc('N', 'C', '3', '0')
>>> +/* Sensor Ancillary metadata */
>>> +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S')
>>> +/* BCM2835 ISP image statistics output */
>>> +#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A')
>>> +
> 
> Similarly, these have also been moved to the right header files.
> 
>>> +#define V4L2_CID_USER_BCM2835_ISP_CC_MATRIX  \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0001)
>>> +#define V4L2_CID_USER_BCM2835_ISP_LENS_SHADING       \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0002)
>>> +#define V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL        \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0003)
>>> +#define V4L2_CID_USER_BCM2835_ISP_GEQ                \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0004)
>>> +#define V4L2_CID_USER_BCM2835_ISP_GAMMA              \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0005)
>>> +#define V4L2_CID_USER_BCM2835_ISP_DENOISE    \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0006)
>>> +#define V4L2_CID_USER_BCM2835_ISP_SHARPEN    \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0007)
>>> +#define V4L2_CID_USER_BCM2835_ISP_DPC                \
>>> +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0008)
>>
>> There is no documentation for these controls. Specifically, it doesn't
>> tell you which struct should be used.
> 
> As above, the documentaiton is available in the newer patch.
> 
>>
>>> +
>>> +/*
>>> + * All structs below are directly mapped onto the equivalent structs in
>>> + * drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
>>> + * for convenience.
>>> + */
>>> +
>>> +/**
>>> + * struct bcm2835_isp_rational - Rational value type.
>>> + *
>>> + * @num:     Numerator.
>>> + * @den:     Denominator.
>>> + */
>>> +struct bcm2835_isp_rational {
>>> +     __s32 num;
>>> +     __s32 den;
>>
>> Wouldn't it make more sense if den is a __u32?
> 
> Ack
> 
>>
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_ccm - Colour correction matrix.
>>> + *
>>> + * @ccm:     3x3 correction matrix coefficients.
>>> + * @offsets: 1x3 correction offsets.
>>> + */
>>> +struct bcm2835_isp_ccm {
>>> +     struct bcm2835_isp_rational ccm[3][3];
>>> +     __s32 offsets[3];
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_custom_ccm - Custom CCM applied with the
>>> + *                              V4L2_CID_USER_BCM2835_ISP_CC_MATRIX ctrl.
>>> + *
>>> + * @enabled: Enable custom CCM.
>>> + * @ccm:     Custom CCM coefficients and offsets.
>>> + */
>>> +struct bcm2835_isp_custom_ccm {
>>> +     __u32 enabled;
>>> +     struct bcm2835_isp_ccm ccm;
>>> +};
>>> +
>>> +/**
>>> + * enum bcm2835_isp_gain_format - format of the gains in the lens shading
>>> + *                             tables used with the
>>> + *                             V4L2_CID_USER_BCM2835_ISP_LENS_SHADING ctrl.
>>> + *
>>> + * @GAIN_FORMAT_U0P8_1:              Gains are u0.8 format, starting at 1.0
>>> + * @GAIN_FORMAT_U1P7_0:              Gains are u1.7 format, starting at 0.0
>>> + * @GAIN_FORMAT_U1P7_1:              Gains are u1.7 format, starting at 1.0
>>> + * @GAIN_FORMAT_U2P6_0:              Gains are u2.6 format, starting at 0.0
>>> + * @GAIN_FORMAT_U2P6_1:              Gains are u2.6 format, starting at 1.0
>>> + * @GAIN_FORMAT_U3P5_0:              Gains are u3.5 format, starting at 0.0
>>> + * @GAIN_FORMAT_U3P5_1:              Gains are u3.5 format, starting at 1.0
>>> + * @GAIN_FORMAT_U4P10:               Gains are u4.10 format, starting at 0.0
>>> + */
>>> +enum bcm2835_isp_gain_format {
>>> +     GAIN_FORMAT_U0P8_1 = 0,
>>> +     GAIN_FORMAT_U1P7_0 = 1,
>>> +     GAIN_FORMAT_U1P7_1 = 2,
>>> +     GAIN_FORMAT_U2P6_0 = 3,
>>> +     GAIN_FORMAT_U2P6_1 = 4,
>>> +     GAIN_FORMAT_U3P5_0 = 5,
>>> +     GAIN_FORMAT_U3P5_1 = 6,
>>> +     GAIN_FORMAT_U4P10  = 7,
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_lens_shading - Lens shading tables supplied with the
>>> + *                                V4L2_CID_USER_BCM2835_ISP_LENS_SHADING
>>> + *                                ctrl.
>>> + *
>>> + * @enabled:         Enable lens shading.
>>> + * @grid_cell_size:  Size of grid cells in samples (16, 32, 64, 128 or 256).
>>> + * @grid_width:              Width of lens shading tables in grid cells.
>>> + * @grid_stride:     Row to row distance (in grid cells) between grid cells
>>> + *                   in the same horizontal location.
>>> + * @grid_height:     Height of lens shading tables in grid cells.
>>> + * @mem_handle_table:        Memory handle to the tables.
>>
>> What sort of handle is this? I.e. where does it come from?
> 
> I believe there was a separte discusion about this.  This is a vcsm
> handle that is used to store the table coefficients in memory that is
> accessible from Videocore.  There is work in progress to update this
> to use dmabuf handles.
> 
>>
>>> + * @ref_transform:   Reference transform - unsupported, please pass zero.
>>> + * @corner_sampled:  Whether the gains are sampled at the corner points
>>> + *                   of the grid cells or in the cell centres.
>>> + * @gain_format:     Format of the gains (see enum &bcm2835_isp_gain_format).
>>> + */
>>> +struct bcm2835_isp_lens_shading {
>>> +     __u32 enabled;
>>> +     __u32 grid_cell_size;
>>> +     __u32 grid_width;
>>> +     __u32 grid_stride;
>>> +     __u32 grid_height;
>>> +     __u32 mem_handle_table;
>>> +     __u32 ref_transform;
>>> +     __u32 corner_sampled;
>>> +     __u32 gain_format;
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_black_level - Sensor black level set with the
>>> + *                               V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL ctrl.
>>> + *
>>> + * @enabled:         Enable black level.
>>> + * @black_level_r:   Black level for red channel.
>>> + * @black_level_g:   Black level for green channels.
>>> + * @black_level_b:   Black level for blue channel.
>>> + */
>>> +struct bcm2835_isp_black_level {
>>> +     __u32 enabled;
>>> +     __u16 black_level_r;
>>> +     __u16 black_level_g;
>>> +     __u16 black_level_b;
>>> +     __u8 pad_[2]; /* Unused */
>>
>> I prefer 'padding' over 'pad_'.
> 
> Ack
> 
>>
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_geq - Green equalisation parameters set with the
>>> + *                       V4L2_CID_USER_BCM2835_ISP_GEQ ctrl.
>>> + *
>>> + * @enabled: Enable green equalisation.
>>> + * @offset:  Fixed offset of the green equalisation threshold.
>>> + * @slope:   Slope of the green equalisation threshold.
>>> + */
>>> +struct bcm2835_isp_geq {
>>> +     __u32 enabled;
>>> +     __u32 offset;
>>> +     struct bcm2835_isp_rational slope;
>>> +};
>>> +
>>> +#define BCM2835_NUM_GAMMA_PTS 33
>>> +
>>> +/**
>>> + * struct bcm2835_isp_gamma - Gamma parameters set with the
>>> + *                         V4L2_CID_USER_BCM2835_ISP_GAMMA ctrl.
>>> + *
>>> + * @enabled: Enable gamma adjustment.
>>> + * @X:               X values of the points defining the gamma curve.
>>> + *           Values should be scaled to 16 bits.
>>> + * @Y:               Y values of the points defining the gamma curve.
>>> + *           Values should be scaled to 16 bits.
>>
>> I assume 0 == black and 0xffff == white (or max luminance)?
>>
>> And so typically x[0] == y[0] == 0 and x[32] == y[32] == 0xffff?
>>
> 
> Typically yes, but it is not strictily true.  We could have parameters
> that clip the signal above min (0) and below max (0xffff).
> 
>>> + */
>>> +struct bcm2835_isp_gamma {
>>> +     __u32 enabled;
>>> +     __u16 x[BCM2835_NUM_GAMMA_PTS];
>>> +     __u16 y[BCM2835_NUM_GAMMA_PTS];
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_denoise - Denoise parameters set with the
>>> + *                           V4L2_CID_USER_BCM2835_ISP_DENOISE ctrl.
>>> + *
>>> + * @enabled: Enable denoise.
>>> + * @constant:        Fixed offset of the noise threshold.
>>> + * @slope:   Slope of the noise threshold.
>>> + * @strength:        Denoise strength between 0.0 (off) and 1.0 (maximum).
>>> + */
>>> +struct bcm2835_isp_denoise {
>>> +     __u32 enabled;
>>> +     __u32 constant;
>>> +     struct bcm2835_isp_rational slope;
>>> +     struct bcm2835_isp_rational strength;
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_sharpen - Sharpen parameters set with the
>>> + *                           V4L2_CID_USER_BCM2835_ISP_SHARPEN ctrl.
>>> + *
>>> + * @enabled: Enable sharpening.
>>> + * @threshold:       Threshold at which to start sharpening pixels.
>>> + * @strength:        Strength with which pixel sharpening increases.
>>> + * @limit:   Limit to the amount of sharpening applied.
>>> + */
>>> +struct bcm2835_isp_sharpen {
>>> +     __u32 enabled;
>>> +     struct bcm2835_isp_rational threshold;
>>> +     struct bcm2835_isp_rational strength;
>>> +     struct bcm2835_isp_rational limit;
>>> +};
>>> +
>>> +/**
>>> + * enum bcm2835_isp_dpc_mode - defective pixel correction (DPC) strength.
>>> + *
>>> + * @DPC_MODE_OFF:            No DPC.
>>> + * @DPC_MODE_NORMAL:         Normal DPC.
>>> + * @DPC_MODE_STRONG:         Strong DPC.
>>> + */
>>> +enum bcm2835_isp_dpc_mode {
>>> +     DPC_MODE_OFF = 0,
>>> +     DPC_MODE_NORMAL = 1,
>>> +     DPC_MODE_STRONG = 2,
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_dpc - Defective pixel correction (DPC) parameters set
>>> + *                       with the V4L2_CID_USER_BCM2835_ISP_DPC ctrl.
>>> + *
>>> + * @enabled: Enable DPC.
>>> + * @strength:        DPC strength (see enum &bcm2835_isp_dpc_mode).
>>
>> Isn't DPC_MODE_OFF equal to just setting 'enabled' to false? If so,
>> wouldn't the 'strength' field be sufficient?
> 
> This is a bit of a quirk of the hardware pipeline.  DPC_MODE_OFF still
> keeps the block enabled, but running (mostly) as a passthrough.  The
> enabled field physically switches off the block.
> 
>>
>>> + */
>>> +struct bcm2835_isp_dpc {
>>> +     __u32 enabled;
>>> +     __u32 strength;
>>> +};
>>> +
>>> +/*
>>> + * ISP statistics structures.
>>> + *
>>> + * The bcm2835_isp_stats structure is generated at the output of the
>>> + * statistics node.  Note that this does not directly map onto the statistics
>>> + * output of the ISP HW.  Instead, the MMAL firmware code maps the HW statistics
>>> + * to the bcm2835_isp_stats structure.
>>> + */
>>> +#define DEFAULT_AWB_REGIONS_X 16
>>> +#define DEFAULT_AWB_REGIONS_Y 12
>>> +
>>> +#define NUM_HISTOGRAMS 2
>>> +#define NUM_HISTOGRAM_BINS 128
>>> +#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
>>> +#define FLOATING_REGIONS 16
>>> +#define AGC_REGIONS 16
>>> +#define FOCUS_REGIONS 12
>>> +
>>> +/**
>>> + * struct bcm2835_isp_stats_hist - Histogram statistics
>>> + *
>>> + * @r_hist:  Red channel histogram.
>>> + * @g_hist:  Combined green channel histogram.
>>> + * @b_hist:  Blue channel histogram.
>>> + */
>>> +struct bcm2835_isp_stats_hist {
>>> +     __u32 r_hist[NUM_HISTOGRAM_BINS];
>>> +     __u32 g_hist[NUM_HISTOGRAM_BINS];
>>> +     __u32 b_hist[NUM_HISTOGRAM_BINS];
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_stats_region - Region sums.
>>> + *
>>> + * @counted: The number of 2x2 bayer tiles accumulated.
>>> + * @notcounted:      The number of 2x2 bayer tiles not accumulated.
>>> + * @r_sum:   Total sum of counted pixels in the red channel for a region.
>>> + * @g_sum:   Total sum of counted pixels in the green channel for a region.
>>> + * @b_sum:   Total sum of counted pixels in the blue channel for a region.
>>> + */
>>> +struct bcm2835_isp_stats_region {
>>> +     __u32 counted;
>>> +     __u32 notcounted;
>>> +     __u64 r_sum;
>>> +     __u64 g_sum;
>>> +     __u64 b_sum;
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_stats_focus - Focus statistics.
>>> + *
>>> + * @contrast_val:    Focus measure - accumulated output of the focus filter.
>>> + *                   In the first dimension, index [0] counts pixels below a
>>> + *                   preset threshold, and index [1] counts pixels above the
>>> + *                   threshold.  In the second dimension, index [0] uses the
>>> + *                   first predefined filter, and index [1] uses the second
>>> + *                   predefined filter.
>>> + * @contrast_val_num:        The number of counted pixels in the above accumulation.
>>> + */
>>> +struct bcm2835_isp_stats_focus {
>>> +     __u64 contrast_val[2][2];
>>> +     __u32 contrast_val_num[2][2];
>>> +};
>>> +
>>> +/**
>>> + * struct bcm2835_isp_stats - ISP statistics.
>>> + *
>>> + * @version:         Version of the bcm2835_isp_stats structure.
>>> + * @size:            Size of the bcm2835_isp_stats structure.
>>> + * @hist:            Histogram statistics for the entire image.
>>> + * @awb_stats:               Statistics for the regions defined for AWB calculations.
>>> + * @floating_stats:  Statistics for arbitrarily placed (floating) regions.
>>> + * @agc_stats:               Statistics for the regions defined for AGC calculations.
>>> + * @focus_stats:     Focus filter statistics for the focus regions.
>>> + */
>>> +struct bcm2835_isp_stats {
>>> +     __u32 version;
>>> +     __u32 size;
>>> +     struct bcm2835_isp_stats_hist hist[NUM_HISTOGRAMS];
>>> +     struct bcm2835_isp_stats_region awb_stats[AWB_REGIONS];
>>> +     struct bcm2835_isp_stats_region floating_stats[FLOATING_REGIONS];
>>> +     struct bcm2835_isp_stats_region agc_stats[AGC_REGIONS];
>>> +     struct bcm2835_isp_stats_focus focus_stats[FOCUS_REGIONS];
>>> +};
>>> +
>>> +#endif /* __BCM2835_ISP_H_ */
>>> diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
>>> index 106f71e709df..072f3c755a68 100644
>>> --- a/drivers/staging/vc04_services/vchiq-mmal/Kconfig
>>> +++ b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
>>> @@ -5,4 +5,5 @@ config BCM2835_VCHIQ_MMAL
>>>       help
>>>         Enables the MMAL API over VCHIQ interface as used for the
>>>         majority of the multimedia services on VideoCore.
>>> -       Defaults to Y when the Broadcomd BCM2835 camera host is selected.
>>> +       Defaults to Y when the Broadcomd BCM2835 camera host or ISP are
>>> +       selected.
>>> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
>>> index 44ba91aa6d47..8d904fcce388 100644
>>> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
>>> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
>>> @@ -100,6 +100,10 @@
>>>   */
>>>  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
>>>
>>> +/** ISP image statistics format
>>> + */
>>> +#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
>>> +
>>>  /* }@ */
>>>
>>>  /** \name Pre-defined audio encodings */
>>> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
>>> index 1793103b18fd..b3552af5cf8f 100644
>>> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
>>> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
>>> @@ -221,6 +221,62 @@ enum mmal_parameter_camera_type {
>>>       MMAL_PARAMETER_SHUTTER_SPEED,
>>>               /**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
>>>       MMAL_PARAMETER_CUSTOM_AWB_GAINS,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
>>> +     MMAL_PARAMETER_CAMERA_SETTINGS,
>>> +             /**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
>>> +     MMAL_PARAMETER_PRIVACY_INDICATOR,
>>> +             /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
>>> +     MMAL_PARAMETER_VIDEO_DENOISE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
>>> +     MMAL_PARAMETER_STILLS_DENOISE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
>>> +     MMAL_PARAMETER_ANNOTATE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
>>> +     MMAL_PARAMETER_STEREOSCOPIC_MODE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
>>> +     MMAL_PARAMETER_CAMERA_INTERFACE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
>>> +     MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
>>> +     MMAL_PARAMETER_CAMERA_RX_CONFIG,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
>>> +     MMAL_PARAMETER_CAMERA_RX_TIMING,
>>> +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
>>> +     MMAL_PARAMETER_DPF_CONFIG,
>>> +
>>> +     /* 0x50 */
>>> +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
>>> +     MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
>>> +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
>>> +     MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
>>> +     MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
>>> +     MMAL_PARAMETER_BLACK_LEVEL,
>>> +             /**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
>>> +     MMAL_PARAMETER_RESIZE_PARAMS,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CROP_T */
>>> +     MMAL_PARAMETER_CROP,
>>> +             /**< Takes a @ref MMAL_PARAMETER_INT32_T */
>>> +     MMAL_PARAMETER_OUTPUT_SHIFT,
>>> +             /**< Takes a @ref MMAL_PARAMETER_INT32_T */
>>> +     MMAL_PARAMETER_CCM_SHIFT,
>>> +             /**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
>>> +     MMAL_PARAMETER_CUSTOM_CCM,
>>> +             /**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
>>> +     MMAL_PARAMETER_ANALOG_GAIN,
>>> +             /**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
>>> +     MMAL_PARAMETER_DIGITAL_GAIN,
>>> +             /**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
>>> +     MMAL_PARAMETER_DENOISE,
>>> +             /**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
>>> +     MMAL_PARAMETER_SHARPEN,
>>> +             /**< Takes a @ref MMAL_PARAMETER_GEQ_T */
>>> +     MMAL_PARAMETER_GEQ,
>>> +             /**< Tales a @ref MMAP_PARAMETER_DPC_T */
>>> +     MMAL_PARAMETER_DPC,
>>> +             /**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
>>> +     MMAL_PARAMETER_GAMMA,
>>>  };
>>>
>>>  struct mmal_parameter_rational {
>>> @@ -779,7 +835,102 @@ struct mmal_parameter_camera_info {
>>>       struct mmal_parameter_camera_info_camera
>>>               cameras[MMAL_PARAMETER_CAMERA_INFO_MAX_CAMERAS];
>>>       struct mmal_parameter_camera_info_flash
>>> -                             flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
>>> +             flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
>>> +};
>>> +
>>> +struct mmal_parameter_ccm {
>>> +     struct mmal_parameter_rational ccm[3][3];
>>> +     s32 offsets[3];
>>> +};
>>> +
>>> +struct mmal_parameter_custom_ccm {
>>> +     u32 enabled; /**< Enable the custom CCM. */
>>> +     struct mmal_parameter_ccm ccm; /**< CCM to be used. */
>>> +};
>>> +
>>> +struct mmal_parameter_lens_shading {
>>> +     u32 enabled;
>>> +     u32 grid_cell_size;
>>> +     u32 grid_width;
>>> +     u32 grid_stride;
>>> +     u32 grid_height;
>>> +     u32 mem_handle_table;
>>> +     u32 ref_transform;
>>> +};
>>> +
>>> +enum mmal_parameter_ls_gain_format_type {
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 = 0,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 = 1,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 = 2,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 = 3,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 = 4,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 = 5,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 = 6,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  = 7,
>>> +     MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
>>> +};
>>> +
>>> +struct mmal_parameter_lens_shading_v2 {
>>> +     u32 enabled;
>>> +     u32 grid_cell_size;
>>> +     u32 grid_width;
>>> +     u32 grid_stride;
>>> +     u32 grid_height;
>>> +     u32 mem_handle_table;
>>> +     u32 ref_transform;
>>> +     u32 corner_sampled;
>>> +     enum mmal_parameter_ls_gain_format_type gain_format;
>>> +};
>>> +
>>> +struct mmal_parameter_black_level {
>>> +     u32 enabled;
>>> +     u16 black_level_r;
>>> +     u16 black_level_g;
>>> +     u16 black_level_b;
>>> +     u8 pad_[2]; /* Unused */
>>> +};
>>> +
>>> +struct mmal_parameter_geq {
>>> +     u32 enabled;
>>> +     u32 offset;
>>> +     struct mmal_parameter_rational slope;
>>> +};
>>> +
>>> +#define MMAL_NUM_GAMMA_PTS 33
>>> +struct mmal_parameter_gamma {
>>> +     u32 enabled;
>>> +     u16 x[MMAL_NUM_GAMMA_PTS];
>>> +     u16 y[MMAL_NUM_GAMMA_PTS];
>>> +};
>>> +
>>> +struct mmal_parameter_denoise {
>>> +     u32 enabled;
>>> +     u32 constant;
>>> +     struct mmal_parameter_rational slope;
>>> +     struct mmal_parameter_rational strength;
>>> +};
>>> +
>>> +struct mmal_parameter_sharpen {
>>> +     u32 enabled;
>>> +     struct mmal_parameter_rational threshold;
>>> +     struct mmal_parameter_rational strength;
>>> +     struct mmal_parameter_rational limit;
>>> +};
>>> +
>>> +enum mmal_dpc_mode {
>>> +     MMAL_DPC_MODE_OFF = 0,
>>> +     MMAL_DPC_MODE_NORMAL = 1,
>>> +     MMAL_DPC_MODE_STRONG = 2,
>>> +     MMAL_DPC_MODE_MAX = 0x7FFFFFFF,
>>> +};
>>> +
>>> +struct mmal_parameter_dpc {
>>> +     u32 enabled;
>>> +     u32 strength;
>>> +};
>>> +
>>> +struct mmal_parameter_crop {
>>> +     struct vchiq_mmal_rect rect;
>>>  };
>>>
>>>  #endif
>>>
>>
>> Regards,
>>
>>         Hans
> 
> Regards,
> Naush
> 

