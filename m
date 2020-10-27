Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44D229A819
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 10:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895770AbgJ0Jnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 05:43:45 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59241 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2895759AbgJ0Jnn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 05:43:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id XLVwk5zHLTPdiXLVzksttd; Tue, 27 Oct 2020 10:43:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603791820; bh=7OvPOOfouHzaQwZRc3tsjxhY1NbEiPztHNA6LhXeztg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ce5c3griuE3rq7Hm1ZJXguo3ZHYTQFgMf+ACLjGIanmZSAghtnMgveq0Tj/ydvKBu
         75K33Le8aM52XKP+gplF5hHMIksLNgvCgDJTA69pfBGGydphXGzd/tdhcNM9m9sAFD
         umlEgP2Vsxckoi82cafPuZ+R0XVXhXYexywSLrtvnIceCOijEHikktoYaCMIxbwgj0
         MpnfIlKteD9Q7v1FB+IquSPFs2mDizWMkLhUL4IoGjGpQZjbQwDuudM512+mMzT8iI
         2jVgV+pzEkUwvGvyY4enISeiZGS0VdSmcsHEvgWcZmmXWOO/FJYlScrc2/yrKi4Oak
         /VNTQnI1WwFbg==
Subject: Re: [PATCH v5 1/2] staging: media: imx: remove commented code
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Deepak R Varma <mh12gx2825@gmail.com>
Cc:     outreachy-kernel@googlegroups.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
 <20201026040017.GA5074@my--box> <20201026055631.GA779791@kroah.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <81449e51-957e-9478-5146-9c467248ccd3@xs4all.nl>
Date:   Tue, 27 Oct 2020 10:43:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201026055631.GA779791@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBckpXBuqDk++qNrP/DL2fhtT53LWzR/R0H3WH/Yh68JaQqDu0rrcpYSVqhFm37W2WbSMRXIBPZK1MYD+6zcIdIVEaR157OHYDnN4BndhFYlUsEB5N4R
 FdbldL2NBZ3CKC9SgECWB2fw0TstvvWEI03+QAI51tf/pAYVI9tP1l+esggEoR27MidNLJUQj8ZtWiBLIkG0vahKZHjDAELnBs16KgUMQiKOiHwc9mHlkv7j
 GfWCF0al32i9gSOxY5S5MeOjFa2+STT7znfn8TQZQQumSauGldGNAq8hSwKtSmr4MhvmOa1rXWlr5lt84zHPM+ZO914QKt3eLZKkGlffJHz+QWzw+Dq16WET
 axiHwZQfJf2NtDUFkGyfFLEO9U2kWSNr8oemLkCVdPvstE+4JdGIAC01QIqNw5pxbkzOkm3aj7hfkmcrk96qjU06S85sCdQ3zMuBmwm5aPnoeeAUeoReV6ji
 Wh/6GDQYbEw+i6teGfbti5YCJDTsmuVKb8q8WglH6mxLRxlBd8bXfU5D54mnQP+ur5IqPWorzlyrV1wnh21zCpiw6xti7Aj8ha6cRw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/10/2020 06:56, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2020 at 09:30:17AM +0530, Deepak R Varma wrote:
>> On Fri, Oct 16, 2020 at 11:10:33PM +0530, Deepak R Varma wrote:
>>
>> Hello All,
>> Request for review / ack of this patch.
> 
> Please never top-post :(
> 
> The merge window only opened up a few hours ago, give maintainers time
> to get to patches (like 2 weeks now).  Also remember, for the outreachy
> project, drivers/staging/media/ patches are not considered and take much
> longer to get reviewed and accepted, as the outreachy documentation
> states.

As media reviewer I've been very, very busy with other things for the past 3 weeks.
I plan to use most (all?) of next week to catch up on things.

Regards,

	Hans
