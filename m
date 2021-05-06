Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217F73750DC
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 10:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbhEFI2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 04:28:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:54078 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233932AbhEFI2U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 04:28:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620289642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/xnaL6kFN9KsqEAuFbTd48q6CFtmJbVvbfDv2/3BiHg=;
        b=J19dmvcOPmRfrtfGJ1yLEX8zra/Lflkcs6kYJLQcole4kWEu7GGgMGr6xTXEbZH81WWJJw
        P/dYUZFsnA/V6g07IgHgiMatpI+3dSBsXl+i4t9fFDjgrGbyURxWo9DPJm1y0XEIBT5L/K
        cqjInBrDELBjrtwCvpFM0qVpHM83tGo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 22CEBAF32;
        Thu,  6 May 2021 08:27:22 +0000 (UTC)
Message-ID: <72f835c84c16b455222fece3bb3527f16ad965be.camel@suse.com>
Subject: Re: [PATCH v2 2/3] media: rc: new driver for USB-UIRT device
From:   Oliver Neukum <oneukum@suse.com>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Date:   Thu, 06 May 2021 10:27:21 +0200
In-Reply-To: <497d6ecc0f020b35be1f1e06b33a955574f433ed.1620251141.git.sean@mess.org>
References: <cover.1620251141.git.sean@mess.org>
         <497d6ecc0f020b35be1f1e06b33a955574f433ed.1620251141.git.sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, den 05.05.2021, 22:57 +0100 schrieb Sean Young:
> +static void uirt_disconnect(struct usb_interface *intf)
> +{
> +       struct uirt *ir = usb_get_intfdata(intf);
> +
> +       rc_unregister_device(ir->rc);
> +       usb_set_intfdata(intf, NULL);
> +       usb_kill_urb(ir->urb_out);
> +       usb_free_urb(ir->urb_out);
> +       usb_kill_urb(ir->urb_in);
> +       usb_free_urb(ir->urb_in);
> +       kfree(ir->in);
> +       kfree(ir->out);
> +       kfree(ir);
> +}

Hi,

almost. Going through this again, it looks like you have a race
condition here.

CPU A					CPU B

usb_kill_urb(ir->urb_out);
usb_free_urb(ir->urb_out);

					uirt_in_callback()
					uirt_response(struct uirt *uirt, u32 len)
					err = usb_submit_urb(uirt->urb_out, GFP_ATOMIC);

					BANG, you are using freeed memory

	Regards
		Oliver


