Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D682AD6D8
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 13:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbgKJMvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 07:51:14 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:26556 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbgKJMvN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 07:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605012672;
        s=strato-dkim-0002; d=fossekall.de;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=p/FJZ5G/5knoAN9UbJJvfgvhABVOVVQA4NmR7zumTXg=;
        b=lefBLRFDjnqPzy1aKFY3XNnwaTsw4i23xXxjEVpevNw2ibocLo59z881HwXupWdymj
        4VCDsffombTblPHmfZlOXyzF+Bl0a4SCoWIqgUsUkqR0dSwwp2H6F1rssMpAw+n6R77M
        1H1MLZ+fI0mRntl32OrCcsRJbV47+KCRhs0WzhfVf2VQP0uGmyVHJEOMIV4elCmOIRGn
        SyUGPOJfAdUleCWZ8lOuyoWsYMNEixqseqaS5ZKIOTPXM3+wgupzxOU64bDdVjbnln10
        IQa0SqDb9qDbXeghgWSxzscVfPBudOfty7I8GTdpgjDpcOD2K9+FTHFXnxii9ewH/cQT
        pKrA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBOdI6BL9pkS3QW19mO7I+/JwRspuzJFZuRzQ=="
X-RZG-CLASS-ID: mo00
Received: from aerfugl
        by smtp.strato.de (RZmta 47.3.4 AUTH)
        with ESMTPSA id g02087wAACm70mD
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 10 Nov 2020 13:48:07 +0100 (CET)
Received: from koltrast.a98shuttle.de ([192.168.1.27] helo=a98shuttle.de)
        by aerfugl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <michael@fossekall.de>)
        id 1kcT4A-000399-Ji; Tue, 10 Nov 2020 13:48:06 +0100
Date:   Tue, 10 Nov 2020 13:48:05 +0100
From:   Michael Klein <michael@fossekall.de>
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/2] media: rc: gpio-ir-recv: add timeout
 property
Message-ID: <20201110124805.GA29796@a98shuttle.de>
References: <cover.1604589023.git.michael@fossekall.de>
 <20201110101727.GA26198@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201110101727.GA26198@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 10, 2020 at 10:17:27AM +0000, Sean Young wrote:
>On Mon, Nov 09, 2020 at 04:23:09PM +0100, Michael Klein wrote:
>> The default recorder timeout of 125ms is too high for some BPF protocol
>> decoders when a remote sends repeat codes at high rates. This makes the
>> timeout configurable via the devicetree.
>
>To be honest, 125ms is too much by any measurement. The longest space
>in any protocol I'm aware of is 40ms in the sharp ir protocol. I think
>changing IR_DEFAUL_TIMEOUT to something like 50ms would make sense.

Seconded. I'm happy to prepare a patch if changing the default value is 
acceptable.

>Also, when an BPF protocol is loaded, user-space can set the timeout
>with the LIRC_SET_REC_TIMEOUT ioctl which can depend on the protocol
>(set to longest space + 10ms error margin).

Right, although this is a bit cumbersome with current user-space tools. 
The BPF is loaded with ir-keytable, while the recorder timeout needs to 
be set with it-ctl. In the Debian world, those tools are even in 
different packages.

>This would mean that the
>bare minimum timeout can be set, which means decoding is as responsive
>as can be.
>
>I'm not sure that device tree is really the place for this.

Not arguing about this, but IMHO no less than for rc-map-name. So this 
seems to be at least consistent.

Thanks,

Michael
