Return-Path: <linux-media+bounces-46191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D75C2AF4E
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3F11891CFC
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A957261E;
	Mon,  3 Nov 2025 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8PK8xNq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B02FD677
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164913; cv=none; b=cVvrebGJOZcncVH6+XZ+XNw42id5Hcuk6J+ggYIwjJstNWx2nzd2Pkd1Q92oak+X00SI/p2/PdBiWZI/P0VJ0Ptb8Cmd64n7OHQr9/Ti+ee57etWWV9a0iy0jGRvv7euU6uHvt8n63pLOciKAs8pEdtzOdIheqnVQcOiy8gZWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164913; c=relaxed/simple;
	bh=MBILiLTdrJLo3mMAR/OMxTXVD4aQqw+H+ejOGzlgCp8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pgap3vi+qgT2+QzSltMDfjsCNKWQE2AJWqj5TMuneYDZvVoiPZWxeCywQpEgOg+zy/1QjIk0tfg7++AkKRNQL1W9N1NJI2f5IeGx9wm3SmfdwFjdNMOhPYTqgQGvSlqut6zypUlqy6vTz2+IYc3pAv2Z4Gl1wUt8g394cuAF790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8PK8xNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD13C116B1;
	Mon,  3 Nov 2025 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164912;
	bh=MBILiLTdrJLo3mMAR/OMxTXVD4aQqw+H+ejOGzlgCp8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=r8PK8xNqjHkmyCLwX0xoQ0Bjxvn7RIrkRx5cQKl8Ywfp3bKs4BcJV5Slwi5Hih2DA
	 4YqqMazD2sjm6KNpCKfg6yEvEW1j3njlKKQUTxRF7H7iM3SR9PkMkKhTBlRAhV5XrD
	 3ONkNxXyaMW/5C6fR/NA+NZZH4yUC5ADd9pQ7DQ1mWsu5KE95FQa/r2009Fw5iR+Dq
	 XFc+CrrL7NxoMNI7iRYQsl+5b0gTovF0lTnV0y9PV7kuve01bURZEwk+cS02D+5ObR
	 d8vZ3ToIsnYClhvP5wjCyfwNlVxgtr5OQni8yC2zZvoGheSrJML2t+dzozoE3DxDzn
	 B6mERC8zdUPkQ==
Message-ID: <bdffda14-cb84-45ce-98ac-03d53762b888@kernel.org>
Date: Mon, 3 Nov 2025 11:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR v6.19] NXP media drivers changes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251103001640.GA9221@pendragon.ideasonboard.com>
 <4989c563-47f4-478c-80c4-41f7e98597e4@kernel.org>
 <20251103100456.GO27255@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20251103100456.GO27255@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 11:04, Laurent Pinchart wrote:
> On Mon, Nov 03, 2025 at 09:08:10AM +0100, Hans Verkuil wrote:
>> Hi Laurent,
>>
>> I noticed you forgot to CC to linux-media (I added that now), but also that all
> 
> Oops sorry, my bad.
> 
>> these patches have a Link: tag. Linus only wants Link tags if there is additional
>> information through that link. That's not the case here.
>>
>> I'm dropping the Link tags from the patches in this PR, let me know if you disagree.
> 
> You missed the last episode of the drama :-)
> 
> https://lore.kernel.org/all/CAHk-=wj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSpTKR+=Vtw@mail.gmail.com/
> 
> We can use Link: trailers to reference the patch that was picked, and we
> need to use the patch.msgid.link domain for that purpose. Adding

OK. Good to know. I'm fixing my check for Link: tags to test for that domain.

Regards,

	Hans

> 
> [b4]
> 	linkmask = https://patch.msgid.link/%s
> 
> to your .gitconfig will instruct b4 to use that domain.
> 
>> On 03/11/2025 01:16, Laurent Pinchart wrote:
>>> Hi Hans, Mauro,
>>>
>>> The following changes since commit 163917839c0eea3bdfe3620f27f617a55fd76302:
>>>
>>>   MAINTAINERS: Update Daniel Scally's email address (2025-10-29 14:07:02 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20251103
>>>
>>> for you to fetch changes up to a581a7c7d2c354131e184a8770f761c40168dda6:
>>>
>>>   media: imx8mq-mipi-csi2: drop unused module alias (2025-11-03 01:23:28 +0200)
>>>
>>> ----------------------------------------------------------------
>>> NXP media drivers changes:
>>>
>>> - Add Frank Li as a reviewer for NXP media drivers
>>> - Improve buffer sequence in rkisp1
>>> - Add i.MX91 support and i.MX93 parallel input support to imx8-isi
>>> - Drop unused module aliases
>>>
>>> ----------------------------------------------------------------
>>> Alice Yuan (2):
>>>       media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
>>>       media: nxp: imx8-isi: Add parallel camera input support for i.MX93
>>>
>>> Frank Li (1):
>>>       MAINTAINERS: Add Frank Li as reviewer for NXP media drivers
>>>
>>> Guoniu Zhou (3):
>>>       media: nxp: imx8-isi: Refine code by using helper macro
>>>       media: nxp: imx8-isi: Reorder the platform data
>>>       media: nxp: imx8-isi: Add ISI support for i.MX91
>>>
>>> Johan Hovold (3):
>>>       media: imx-mipi-csis: drop unused module alias
>>>       media: imx7-media-csi: drop unused module alias
>>>       media: imx8mq-mipi-csi2: drop unused module alias
>>>
>>> Stefan Klug (1):
>>>       media: rkisp1: Improve frame sequence correctness on stats and params buffers
>>>
>>>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 ++++-
>>>  MAINTAINERS                                        |  4 ++
>>>  drivers/media/platform/nxp/imx-mipi-csis.c         |  1 -
>>>  drivers/media/platform/nxp/imx7-media-csi.c        |  1 -
>>>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 58 +++++++++++++---------
>>>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>>>  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 22 ++++++--
>>>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  1 -
>>>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  1 +
>>>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 27 ++++++++--
>>>  10 files changed, 92 insertions(+), 37 deletions(-)
> 


