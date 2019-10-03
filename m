Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E38CA00C
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 16:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbfJCOGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 10:06:02 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39996 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbfJCOGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 10:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=g5ZI7dzXc6DzdoiPhmhftNfql4ZQHg2viebNXmQcCkQ=; b=e2riPOA0ky61D/JeXl4NU791k
        Mb5LkuuosQPgMBB6vmxhq3Tq2v8pRqruZDMU8402qmhQFDEy6klXdTbNfMqw2kGpQFUQNJmuNxM8k
        tPHUD9eP81bo64My3g28MdiBj5Rf8hxpBFMZq3VfhqPMQd5/1PYjI8uPiFh6qMeh868q8ZzKGPu3Q
        cZoQ8KwqRCEVQGfkdD27/3FL/y8qiJRsuQIKyYOntBLFQFMcQ4R7WUMCKuBep0jF1QTFUlAeZ6C8i
        oQIYhhwl3u0SJ9LJNvq/ZJ7WCDjQ43OJ/wnUE/3cvZLrXmE3/mnTU6F2QCoPD3BQwoi3G5YABx+rT
        mdvVYrLGQ==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG1jv-000161-V2; Thu, 03 Oct 2019 14:05:56 +0000
Date:   Thu, 3 Oct 2019 11:05:51 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003110551.19f06922@coco.lan>
In-Reply-To: <CANL0fFQR4KDU5PKeedK6wF45nSTu6dUyz_MBwmP1QsJxYQAWNg@mail.gmail.com>
References: <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
        <20191003081742.0933264b@coco.lan>
        <CANL0fFTtHn4ocL4BD4cVKhVzjLhnQ0a45yq5x4MxWAVu-tD8sw@mail.gmail.com>
        <20191003094904.3aa5fdc7@coco.lan>
        <20191003095237.2efa0e7f@coco.lan>
        <20191003130224.GA2596@Limone>
        <CANL0fFQR4KDU5PKeedK6wF45nSTu6dUyz_MBwmP1QsJxYQAWNg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 15:53:30 +0200
Gonsolo <gonsolo@gmail.com> escreveu:

> Hi!
> 
> I tried downloading a new firmware via
> 
>        case SI_BOGUS:
> -               dev_info(&client->dev, "Bogus chip version, trying
> with no firmware\n");
> -               fw_name = NULL;
> +               dev_info(&client->dev, "Bogus chip version, trying
> with new firmware\n");
> +               fw_name = SI2157_A30_FIRMWARE;
>                 break;
> 
> which I downloaded from
> 
> +               //
> https://github.com/CoreELEC/dvb-firmware/blob/master/firmware/dvb-tuner-si2157-a30-01.fw
> 
> resulting in
> 
> [  209.312086] si2168 1-0067: downloading firmware from file
> 'dvb-demod-si2168-b40-01.fw'
> [  211.535097] si2168 1-0067: firmware version: B 4.0.25
> [  211.554938] si2157 2-0063: Bogus chip version, trying with new firmware
> [  211.554944] si2157 2-0063: found a 'Silicon Labs Si21255-\xff\xff\xff'
> [  211.557978] si2157 2-0063: downloading firmware from file
> 'dvb-tuner-si2157-a30-01.fw'
> [  215.739092] si2157 2-0063: rebooting tuner...
> [  215.755271] si2157 2-0063: querying firmware version...
> [  215.760756] si2157 2-0063: firmware version: \xff.\xff.255
> 
> . So even with a new firmware the queried numbers are bogus.

Try to reduce the bus speed to 10kbps
> 
> g



Thanks,
Mauro
