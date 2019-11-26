Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4BB110A1DF
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfKZQTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:19:20 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:35089 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfKZQTT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:19:19 -0500
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Nov 2019 11:19:19 EST
Received: from sapphire.tkos.co.il (unknown [192.168.100.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 29BB7440319;
        Tue, 26 Nov 2019 18:11:02 +0200 (IST)
Date:   Tue, 26 Nov 2019 18:11:00 +0200
From:   Baruch Siach <baruch@tkos.co.il>
To:     Stuvart S <lovelinuxdeeply@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: TI Deserializer DT node configuration
Message-ID: <20191126161100.lmow4vehzy3b5vcd@sapphire.tkos.co.il>
References: <CAAMGra5wp8o3DAFQdYk3Ky2oaWaNcX-o4gejW7jro5Rm1pkVug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMGra5wp8o3DAFQdYk3Ky2oaWaNcX-o4gejW7jro5Rm1pkVug@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stuvart,

On Tue, Nov 26, 2019 at 09:25:48PM +0530, Stuvart S wrote:
> I am integrating DS90UB964 deserializer into my custom board based on
> Rcar H3 Salvator XS. Deserializer is connected in i2c6.Also I have my
> four serializers as DS90UB913 and cameras OV10635.
> 
> Can any one please help with the following?
> 
> How Deserializer connects to Serializer in DT node?I came accross
> about the terms remote i2c, i2c-mux,i2c-atr.but I dont understand.I am
> not using any i2c switches.
> Any DT example is helpful for me

You might find this Luca Ceresoli ELCE talk interesting:

  https://www.youtube.com/watch?v=7hLv6fYAW-E

Slides: https://elinux.org/images/f/fc/Ceresoli-elce2019-video-serdes-linux.pdf

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
