Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9B0396F92
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 10:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhFAIxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 04:53:54 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49709 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231139AbhFAIxy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 04:53:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o088lN8wJIpGyo08BlMq5e; Tue, 01 Jun 2021 10:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622537531; bh=nbz0cKWC9ysJbMM4ObvxCtQv5ZZ8DjljHsojQgajDls=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AnPwtvoIue5kvEsmZiszrcweEnfVgBdhYgHP/X9g6dvM+088MHOZE34jO2bD6/GSz
         mM1n2ZViCHQAqtW9s52FDXMnRWcPjkYGV4nx7892vJ4S7GtQSUsIbt0RQtEo2lzCwP
         dWSY+VPRs6LoNFez+BYnL1Vod17IZNJmwETifl4Y0i2laeqcl2J0zYzL6egAOcfH5l
         ZpJiz+1DzHFhEeidpciARGJiKz6P3OW2d8FjUVwvSC8xSqYvQaOAfrjDdsyAjEeKkb
         aauK9Hae/o/XkMkxqxccju0OgwtdUQb+3x1RK/eph1aTCcLxQ5U0ifBKXfX6KmR6J3
         NQGwd6Tc4xR4Q==
Subject: Re: [PATCHv5 0/5] media: uvcvideo: implement UVC 1.5 ROI
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210501082001.100533-1-senozhatsky@chromium.org>
 <8583ed26-ef35-3341-5058-32dbf219d10c@xs4all.nl>
 <YLXz+r8PkKx1VMVc@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <686a3e4e-1e49-f5fd-7620-8670712cf2a8@xs4all.nl>
Date:   Tue, 1 Jun 2021 10:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YLXz+r8PkKx1VMVc@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNABF8yBbrFGh8voNHvyLged/zPCaBUVADj4LGm0VklPIOku4oauQ2DlgHsFanDhHq9LKrdhJCYz9oErV8zr8+msGgLYuFo6UX47zdrPLjx9p2dnDHoI
 QB0aFe/vxoVGwb33JNcIn/0xXHzN2cdozK0lNl3sTBNENrp9RSCBq43VoQNAf5bdgLYxexL4EFT6YGPfKUV9zDifhX38P/KRaWyFTmEO8dMdLeNQJJtZl6nz
 rEp56jLF2+nIPRcBE3egGde3DQc+fk6svlwtd+rZxc90Y7TsfUWNZdpsdFwbyryQ3iZYFBpdYBL8uGhSMGxxOAP+lR0yQPMtrMGtQ0D6i1VeXwfPtFXRUJCr
 7eq9aOYMaugLULidtVIV1mbBzJiYMbclOzaFHvGQflQXBQF5jQhhcxeGyTK+GYaJmhUEJuLp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/06/2021 10:46, Sergey Senozhatsky wrote:
> On (21/05/26 12:38), Hans Verkuil wrote:
>> Hi Sergey,
>>
>> On 01/05/2021 10:19, Sergey Senozhatsky wrote:
>>> Hello,
>>>
>>> 	This patch set implements UVC 1.5 ROI using v4l2_selection API.
>>>
>>> v5:
>>> -- fixed UAPI typo: STABILIXATION
>>> -- moved V4L2_CID_REGION_OF_INTEREST_AUTO to V4L2_CID_CAMERA_CLASS_BASE+36
>>> -- added more comments (Ricardo)
>>> -- added V4L2_CID_REGION_OF_INTEREST_AUTO to v4l2_ctrl_get_name() (Ricardo)
>>>
>>> Sergey Senozhatsky (5):
>>>   media: v4l UAPI: add ROI selection targets
>>
>> As mentioned in my reply to v4 0/5, I am quite strongly opposed to using the
>> Selection API for this as opposed to using controls. Unless someone can provide
>> strong arguments for using the Selection API, I am inclined to reject this.
>>
>> Sorry about that, I probably should have been reviewing this series sooner.
> 
> Hans, any suggestions regarding the UVCs GET_CUR, GET_DEF, GET_MIN/MAX
> requests handling?
> 

Support for current value and default value is already present in the control
framework (V4L2_CTRL_WHICH_CUR_VAL and V4L2_CTRL_WHICH_DEF_VAL). MIN/MAX support
would have to be added by creating V4L2_CTRL_WHICH_MIN/MAX_VAL defines and
implementing this in the control framework, pretty much along the same lines
as the DEF_VAL support. Should be quite easy.

Regards,

	Hans
