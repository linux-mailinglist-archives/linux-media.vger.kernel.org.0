Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 245821897AA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgCRJN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:13:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36298 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgCRJNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=uZ0zRS3WXiCJbgYe8K6NCdPLyH3g2ZSIxznfnHohJPA=; b=uuBpKfOsrUt6XXPL5cC4HSPERm
        XqFGvVRWbxekVFPHv2e8ZPS1UbNQiI2EureZ0s/rGoG2nbnXdwHC1q2YUoxrFhZ2oN2hFfZSQqzK5
        ydQvReb1fQ8aATBX/KaQT1mTlxyBGBKLnBDvwaCHgFBLNVy/6M4JQnHhfgAe5+wZh8eXgce+/wcm+
        i+IIl5f35faLNWQB0AY/wLFSo8lARnstctC2ZZ37HvZMeKsCw1MRSId0jaRZOgoJ0pJlWuoagVyCg
        JMIZYhsijLPLJbM7qXeQgBA5FYMT2dMoIUPUPCzH1TVn3y0lJgqZps28SDvW09WxjgBmgXEFR7Zch
        dZ6JImXA==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jEUlo-0007t4-9Z; Wed, 18 Mar 2020 09:13:48 +0000
Date:   Wed, 18 Mar 2020 10:13:43 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [RFC 1/3] media: dvb_dummy_tuner: implement driver skeleton
Message-ID: <20200318101343.7d68ae15@coco.lan>
In-Reply-To: <9a7bdcf5-502e-45c2-ddcd-e04c5c939a09@ideasonboard.com>
References: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
        <20200318060018.3437750-2-dwlsalmeida@gmail.com>
        <9a7bdcf5-502e-45c2-ddcd-e04c5c939a09@ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 18 Mar 2020 08:54:18 +0000
Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> escreveu:

> Hi Daniel,
> 
> On 18/03/2020 06:00, Daniel W. S. Almeida wrote:
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> > 
> > The virtual DVB test driver serves as a reference DVB driver and helps
> > validate the existing APIs in the media subsystem. It can also aid developers
> > working on userspace applications.
> > 
> > This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> > ISDB-T and ATSC when completed.  

...

> > +static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
> > +	.driver = {
> > +		.name = "dvb_dummy_tuner",
> > +		.suppress_bind_attrs = true,
> > +	},
> > +	.probe		= dvb_dummy_tuner_i2c_probe,
> > +	.remove		= dvb_dummy_tuner_i2c_remove,
> > +	.id_table	= dvb_dummy_tuner_i2c_id_table,
> > +};
> > +module_i2c_driver(dvb_dummy_tuner_i2c_driver);  
> 
> I suspect as a dummy tuner, this should be a platform driver or such
> rather than an I2C driver, as I assume there is not actual bus or device
> to bind to, and it would then require 'hogging' an available I2C address.

Interesting point. Yet, I guess that the best it to keep it as i2c. 

The DVB framework splits the driver on 3 parts:

	- a frontend driver;
	- a tuner driver;
	- a bridge driver.

on all real hardware, the frontend and bridge drivers are i2c (with
very few exceptions, where it is integrated on the same chipset and
don't use an i2c-like bus internally).

Keeping it as an I2C driver helps to keep it closer to a real hardware,
with would help driver developers to use it as a reference for their
projects.

Thanks,
Mauro
