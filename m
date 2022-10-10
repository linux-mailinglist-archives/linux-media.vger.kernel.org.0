Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3395F9856
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 08:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiJJG3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 02:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiJJG3u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 02:29:50 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240EC14D20;
        Sun,  9 Oct 2022 23:29:46 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 9A89C5C0003;
        Mon, 10 Oct 2022 02:29:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 10 Oct 2022 02:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665383382; x=1665469782; bh=/O4vE3Ayv7
        Q1EXxMUzd/MBPiHS32XX5XqXkETZ0THKE=; b=exxhvE6AZ3PJnNKPk2iIzKYVx9
        3Djg4vdradH1eDGxMRB5H8wsIU+olJZ6LRFP+mSmOEBB9o/Bob6ariZ8WLEZiAaU
        quNEfaHcRlPtrzYEtJMO0Mhk1njHexuvvlsUSjpv1VNCnD6Yw7UrfB4dBsqkrvc1
        Rqy9yQxzEZxN+08hgePE+FvzrRi5h9oSXmBIyG1SNShJrSbZiERABQhrzWfT//Ql
        WfG8XFiLQdmg3c41tnSsilatfDdv5bKxEotWzFie9N64X0dhpBIZQvnI8VpWeUaI
        W1eqFw/KyzCOHvsuqFRpz/V4nP/OqewJuHoBa0TULFVfMPfW7pwqNILo6trw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665383382; x=1665469782; bh=/O4vE3Ayv7Q1EXxMUzd/MBPiHS32
        XX5XqXkETZ0THKE=; b=TD7vKgQgzvNLMc7JwLdTHnKheylQjqhixs0v81lwlcAN
        J6i/McMCmLmA8ATD29ap4dAqoSO/W/5av1U8KSGKNBbaXMb0KMRKkaU75r+yt5pK
        BP2/1FVfCJ5aBgDROHVCWZfpsW08aoKkIUHmeA/4HzGz2mK7KnOp3+vJxRah2saH
        67Omue0HaaR65djaKbWjUIOkLo2o3eCfNrW4XHKHORdp0iClUgZaF3jPO2r5Am6Z
        ibFVbjugwXg3tKDEk8ID04UoSRyESbZhI0Sm2HYaGgApcrVtXY3TEfAbTW4jYC9U
        leQ6OFNYIzYn1KQSnmASaEp/gPp20KECRhOOWbSatA==
X-ME-Sender: <xms:1rtDY_dVbJlQVF-8z78Ck6obhSDV8hel5E-A54aVDAlcrDTV7eBCMw>
    <xme:1rtDY1OgBmJwZe0xrkxywRz_E3BuOLXsZrVkFk26Q5b08I_G015JcWplXqrkLj4eL
    6utbXnZV2Jt6g>
X-ME-Received: <xmr:1rtDY4gtwW5XDc3gst1ypVPt7TGopOz_hG6jhxdIBMvv6I3Mzl8eJpOr1VIe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejvddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:1rtDYw__a-XUcelr9l-_YuO8_ZTS8Mc3n8rD5zQhyDLrA_80iGK2SA>
    <xmx:1rtDY7vXOhYx0XvbCK76DvnUYXD99WZjqhy3w7fp5auC2p3lRpHSbg>
    <xmx:1rtDY_F4KuBPzoFcTE05QWjttYnzkze7nAn4th7xcyQkMy8py7GllA>
    <xmx:1rtDY8nOwovdVZAiV-MOkRMqKhfTP2oeGOif87ApQoQZBVK8ZJI2kw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 02:29:41 -0400 (EDT)
Date:   Mon, 10 Oct 2022 08:30:25 +0200
From:   Greg KH <greg@kroah.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: mark the ctrl request for the
 streaming interface
Message-ID: <Y0O8AYjki6DFZJZ7@kroah.com>
References: <20221009222000.1790385-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009222000.1790385-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 10, 2022 at 12:20:00AM +0200, Michael Grzeschik wrote:
> For the userspace it is needed to distinguish between reqeuests for the
> control or streaming interace. The userspace would have to parse the
> configfs to know which interface index it has to compare the ctrl
> requests against, since the interface numbers are not fixed, e.g. for
> composite gadgets.
> 
> The kernel has this information when handing over the ctrl request to
> the userspace. This patch adds a variable to indicate if the ctrl
> request was meant for the streaming interface.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 6 ++++++
>  include/uapi/linux/usb/g_uvc.h      | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 6e196e06181ecf..132d47798c0f13 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -228,6 +228,7 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
>  	struct uvc_device *uvc = to_uvc(f);
>  	struct v4l2_event v4l2_event;
>  	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
> +	unsigned int interface = le16_to_cpu(ctrl->wIndex) & 0xff;
>  
>  	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
>  		uvcg_info(f, "invalid request type\n");
> @@ -246,6 +247,11 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
>  	uvc->event_length = le16_to_cpu(ctrl->wLength);
>  
>  	memset(&v4l2_event, 0, sizeof(v4l2_event));
> +
> +	/* check for the interface number, so the userspace doesn't have to */
> +	if (interface == uvc->streaming_intf)
> +		uvc_event->ctrlreq_streaming = 1;
> +
>  	v4l2_event.type = UVC_EVENT_SETUP;
>  	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
>  	v4l2_event_queue(&uvc->vdev, &v4l2_event);
> diff --git a/include/uapi/linux/usb/g_uvc.h b/include/uapi/linux/usb/g_uvc.h
> index 652f169a019e7d..8711d706e5bfb0 100644
> --- a/include/uapi/linux/usb/g_uvc.h
> +++ b/include/uapi/linux/usb/g_uvc.h
> @@ -27,6 +27,8 @@ struct uvc_request_data {
>  };
>  
>  struct uvc_event {
> +	/* indicate if the ctrl request is for the streaming interface */
> +	__u8 ctrlreq_streaming;

How can you change a public api structure like this without breaking all
existing userspace code?

thanks,

greg k-h
