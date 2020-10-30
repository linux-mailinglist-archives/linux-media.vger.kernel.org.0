Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4E52A0B0A
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgJ3QZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:25:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50615 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbgJ3QZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:25:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id YXDMkPLR8TPdiYXDPk1fhy; Fri, 30 Oct 2020 17:25:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604075123; bh=lkaemg8urLEXVZSSVrIyfNA/DsBJ61PhUR5Yz1e6QIA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H1P/j+ABSnfXdhwhzhgQPCVi1r5CApztFY7IZoiEIRlIc9GR+nb6HGLeU2l6oVWNk
         Vv7UnKP62F2aEowtU2OBJVwPUIire32nbVGsTrRjxLwrCsRXLH28D+pNM6FAvs4DFe
         HtocafytC9mTY0k4TO81gTQMkEOQEloRSPX4VrWOxA9uXErFnv1f+5iCycXa+feVUq
         nWYENl6/3ufpRYsYBeABp9GXcTtCMoHFZ04+ntnbTAIsbo+ValVcBq8fDPJ+EK3UPo
         c4A0f4DnzPtn+kTU7w3CoyRMthtKDsn8jR7gUhJ7Ukq1Gl688inM6rWgezXnmXhi2P
         blEQqS2yDbQMA==
Subject: Re: edid-decode: Bug in ratio handling?
To:     Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org
References: <20201030155824.ldygcqaclat3vrul@gilmour.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ded171d8-0f69-6eef-7c6f-f1f8529eb5dd@xs4all.nl>
Date:   Fri, 30 Oct 2020 17:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030155824.ldygcqaclat3vrul@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJt30d6Kho67Jnxpf8pFHhgxv438QmKJeWFRrKr8K28oTJBl+f5wXkUjkj6BPu/RpBiWiGTJZtqR/TtBX1pw461QSsv1sAk7KW+tNYfQVoQxusN8NIeJ
 8XUAkNEmvaO+qrJGQYW9R4WzbRF5+YaRJePbbTo+v8nGuyJaimbEoMn5N9VyzBke9kaHtb9fu8bstrfcuIrqsxHYO4zOzG3pl5NFw1G8ROvy0dNSGblzTV0O
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/10/2020 16:58, Maxime Ripard wrote:
> Hi!
> 
> I was playing around with some code to generate EDIDs, and I think I
> found a bug in how edid-decode parses the landscape and portrait ratio
> in the base block, bytes 0x15 and 0x16.
> 
> The spec (section 3.6.2) provides a formula to get back the aspect ratio
> from the stored value which is:
> 
> in landscape
> aspect ratio = (stored value + 99) / 100
> 
> With the value in the byte 0x15
> 
> and in portrait
> aspect ratio =  100 / (stored value + 99)
> 
> with the value in the byte 0x16
> 
> However, parse-base-block.cpp has:
> 
> if (x[0x15])
> 	printf("    Aspect ratio: %f (landscape)\n", 100.0 / (x[0x16] + 99));
> else
> 	printf("    Aspect ratio: %f (portrait)\n", 100.0 / (x[0x15] + 99));
> 
> Which applies the same formula to both ratio types, and seems to invert
> the bytes supposed to be used?
> 
> The spec provides some example later on, for example with 4/3 (so
> 1.333333...) where the stored value is supposed to be 34/0x22, while
> edid-decode parses that as 1.010101

Yup, it's wrong. It's a very old bug, it was already there before I became
maintainer of edid-decode. So not my fault :-)

Thanks!

	Hans
