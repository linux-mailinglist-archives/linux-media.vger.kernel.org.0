Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96703976DD
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 17:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhFAPkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 11:40:18 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36425 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234066AbhFAPkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 11:40:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id o6TPl6vkuEXL0o6TSlu6XP; Tue, 01 Jun 2021 17:38:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622561915; bh=14B2l39gX2JOttpb7Wa5lm2RBI9eVm1w3Y+rTiJsPn8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kmQjR7khNSYp4r5wdP/+h2dhOXMcVjzuCusUk6Og7+Z7C8jR9EqIrA0BkZS7P1zEz
         RbT1lZOHwedeT9kHQvxWVGxdfUY86Qr8IWzXt3I6dFQftTeiZy3EYH6eF4M8V6Umjn
         uPmDNM2Q+kg8efCmELgS/w6x8x8ofJwOYzZeHLpk+AJx9x3mCv2fRVQkPdBwAFOUXy
         KC0Jge2yil5qBCQLdhvxNjLunAglkiWUQDCnGILnkdybk9sOfIrWPSAIZmE4keqbIc
         CH3eYgKqfebqamhfl9lSBJSMLTh1baYLDag2Zl3o4LzhHWYcwoqJUXa/iSpj+riLdU
         pBzWu5zK0Vjrw==
Subject: Re: [GIT FIXES FOR v5.13] Three fixes for 5.13.
To:     Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <e2d6324c-b001-7468-2eb6-3df9f044ae8c@xs4all.nl>
 <CAOMZO5CSWnnCA29GWySYAJNeZGfHom_4LfRP3JNBR2CZFyFpxw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8fa6b0c1-3c3d-3aaf-4bbf-7ccde6895450@xs4all.nl>
Date:   Tue, 1 Jun 2021 17:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5CSWnnCA29GWySYAJNeZGfHom_4LfRP3JNBR2CZFyFpxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGM0O1Rg+GS8vgghxFz+r0AoZVeEjBc1+C7/BRI66xn4G+Y3wZ8q5J4S0subttob/lJHij8hRbCV2NbI5i95Ad7TP9ep2OrgTqWt2528pvD9eEbTw0ym
 g0wwldr0ISgq+FKeAL/93mItAVJTI1OjPnWHhSac9f/lVSoe1viEU1LFYQk2VlVFX7/UAB+JB+21iz8Ot5vxYqULZHYw5ZIxUpoj+QdLO7YRI9VvOxtkTfh9
 I8sUQKegoybF0zEcr56Wfqy3aW8c6RqfE7zy8R4jHi0v4l00JqRfHf4hFNpSXYBdRShESopbvvOzG3m9srsSqCUGLGvv5DgJAtToeh87bSyDSCjDFEGUzjPY
 FWVb2k4Nidfn3kktGWFrIg4RnLLeGA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/05/2021 23:36, Fabio Estevam wrote:
> On Wed, May 5, 2021 at 8:38 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
>> Philipp Zabel (1):
>>       media: video-mux: Skip dangling endpoints
> 
> Looks like this pull request is still missing to be applied. I don't
> see this patch in linux-next yet.

Neither do I. It is marked as Accepted, but I can't find these patches
anywhere. I asked Mauro about this, it looks like something went wrong here.

Thanks for the heads up!

Regards,

	Hans

> 
> Without Philipp's fix the imx-capture driver is broken in mainline.
> 
> Thanks
> 

