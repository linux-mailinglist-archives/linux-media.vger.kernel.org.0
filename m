Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6B9212B50
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 19:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgGBRc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 13:32:57 -0400
Received: from foss.arm.com ([217.140.110.172]:46778 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726829AbgGBRc4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jul 2020 13:32:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59F73D6E;
        Thu,  2 Jul 2020 10:32:56 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03E9C3F71E;
        Thu,  2 Jul 2020 10:32:54 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Helen Koike <helen.koike@collabora.com>,
        Johan Jonker <jbx6244@gmail.com>,
        karthik poduval <karthik.poduval@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, heiko@sntech.de,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com>
 <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
 <CAFP0Ok-NxDDF8TMP4pN=xn6w3H=TYqN3DMfGW-vuiC5qB-Oj5g@mail.gmail.com>
 <CAFP0Ok9XGzVbghbnOOyfXiOOc5-a94uFRu7sD5wXz9sr-+AYEA@mail.gmail.com>
 <9407b6c3-b932-5904-18ff-7c6cbf6bcc8b@gmail.com>
 <ec0e43f0-95af-c0b0-c51b-ea2db4194931@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <34801fe8-cc4f-ed52-674d-ee291f508e05@arm.com>
Date:   Thu, 2 Jul 2020 18:32:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec0e43f0-95af-c0b0-c51b-ea2db4194931@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-02 17:27, Helen Koike wrote:
[...]
> I suggest this:
> 
>    clocks:
>      maxItems: 5
>      minItems: 3
>      description:
>        rk3288 clocks
>          ISP clock
>          ISP AXI clock
>          ISP AHB clock
>          ISP Pixel clock
>          ISP JPEG source clock
>        rk3399 isp0 clocks
>          ISP clock
>          ISP AXI wrapper clock
>          ISP AHB wrapper clock
>        rk3399 isp1 clocks
>          ISP clock
>          ISP AXI wrapper clock
>          ISP AHB wrapper clock
>          ISP Pixel wrapper clock
> 
>    clock-names:
>      oneOf:
>        # rk3288 clocks
>        - items:
>          - const: clk_isp
>          - const: aclk_isp
>          - const: hclk_isp
>          - const: pclk_isp_in
>          - const: sclk_isp_jpe
>        # rk3399 isp0 clocks
>        - items:
>          - const: clk_isp
>          - const: aclk_isp_wrap
>          - const: hclk_isp_wrap
>        # rk3399 isp1 clocks
>        - items:
>          - const: clk_isp
>          - const: aclk_isp_wrap
>          - const: hclk_isp_wrap
>          - const: pclk_isp_wrap

FWIW this looks a little more involved than it might need to be. Ideally 
we're describing things from the point of view of what inputs the device 
itself wants, so the details of exactly *how* a particular SoC's clock 
tree delivers them shouldn't matter to the binding, only to the actual 
clock specifier values ultimately given in the DT.

 From the ISP's PoV, it seems like we've got the fairly standard core 
clock, ACLK and HCLK trio, plus a pixel clock for RK3288 and RK3399 
ISP1, plus a JPEG source clock for RK3288. I'd be inclined to model that 
as simply something like:

     clock-names:
       minItems: 3
       maxItems: 5
       items:
       - const: isp
       - const: aclk
       - const: hclk
       - const: pclk
       - const: sclk_jpe

Plus then not only do we have a nice clean binding, but we avoid all the 
unnecessary faff of having to deal with the "same" clocks by different 
names in drivers, and sidestep the conundrum of what to do when the next 
SoC comes along providing the basic ISP clocks from yet again 
slightly-differently-named branches of its clock tree.

Robin.
