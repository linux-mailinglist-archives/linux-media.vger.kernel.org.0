Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37565182D4A
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLKSc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:18:32 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:34297 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725268AbgCLKSc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:18:32 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CKv4jwQIThVf8CKv7jMB9L; Thu, 12 Mar 2020 11:18:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584008310; bh=ca/p8/FPq1A958nJeonUAY2BkfYHfgvHESYSgFc+glc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rZDKw2t2w2p152T3t4H6DGVHgLB3OmmKhTtzd9LkJkTqP8pvGA1Kb+THEYcA1CKLU
         K33hzDsouk5f/QTZJIjFI/WBuA6yiEqMSVfo76hmyI7lOJ01yIGSBi6wT0dEfu+C7Y
         czh3mVQoW98rgxU7ie4lK8YH4ZJGzVBlvbbFReh6ii5cjMVaLl/Gk1vRhwXSrCocgw
         43H2XwB6w/m3c6cwEUSBBrvqTogR4g913TAundn0Ml6NKbfH7658/fcZq7DfyNQdgG
         yGrATos6TMbxTVDsWxLCm7ysXW2yK26gIc5VY8tEDa9E+DYeQs1WQzS30CWEJ7yawH
         N3qnEPhzftsqg==
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        linux-media@vger.kernel.org
Cc:     virtio-dev@lists.oasis-open.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, egranata@google.com, fziglio@redhat.com,
        keiichiw@chromium.org, kraxel@redhat.com, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
 <20200218202753.652093-2-dmitry.sepp@opensynergy.com>
 <d79df162-5fcc-6ff9-8480-4cff3548bb4a@xs4all.nl>
 <20719772.EfDdHjke4D@os-lin-dmo>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6f8c37b1-8dc4-e3bb-01ed-4ebedaf90915@xs4all.nl>
Date:   Thu, 12 Mar 2020 11:18:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20719772.EfDdHjke4D@os-lin-dmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJELMJwMFtLIxL4rHSTgHSoLnkv9r/QALnHpK5wXSBDgy8N5cJvePKd34bEy1fjPYtPjFRs2k78JmPIS5Z1DIcFwVlFSvXWCQ8WfOYC9lNfMsZiqnztY
 qz54cIXRJdtDkvp6BOjmfwPlpgBWX8cqcaSaNXIQBs5KE52QPsRBK2N2NrsNUos5xPkqfXAnBJZJV0293USRFVvkhUlVmwumn11/9fXjMmr2S899KWquVsgc
 WArFmoKVt1zkJexPtuA3GUrp87VQB3Q7utaVhtlPypgm9Ke6HggSQwEVcbpF7LAUMjaWuVRPtttRw92k9+Ddl/vmJuZ5i8QbWNK/+Vvk/8dSWguAirOV+7IG
 iaHGJTqoFVzAToebuUmg/FDKoL6QoRA/ibgrRtm63WncjupQMTyb0lAmF6fiafQWpT+vActJlYk6RhYoSy1tT9gXWHSo1ahamdRR2V//Csx6AS+ftPala1i+
 FtRK0/cIR2Wrzq6pn7co2P/tjDium/RsPHNNzhrDIEBlygHkChK0U7Qoh1ZKV7E+OH0r4vzXxLgdkI4Y/u7rLDH4RBkatsWyiXyGAr2dbVQYKVRP3Q/Xwo/D
 5X1JlNj5XKjhcYLcCDMj2UJ9nvk1JcHNtUThsmyx7Nj3n4NtA+9IlpG33oNCzAmHfv7I4rbz95FvPkbmcXVNT66ABpjw3iXWYla0C0Tdtshaf7BLbvfxc2FF
 vgSne1YRWCnDOGzGRAzWKeWsDn0KJzgrPpItakkRA44AIP3nuaXjMoe3RisThbv5cCRWJVFALePBeay12MpoaqDDJUm4J69FO7HHSkNiSOp2k5RxlHhN7oZo
 sAgGLv1Pu+tbU/tlpE+8DjeMcqx6XEGmKlkC/r5S3A/whVIEAlagmglMudAyLg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/12/20 11:15 AM, Dmitry Sepp wrote:
> Hi Hans,
> 
> Thank you for your great detailed review!
> 
> I won't provide inline answers as your comments totally make sense. There is 
> only one thing I want to mention:
> 
>>> +	struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANES];
>>
>> Why is this virtio specific? Any reason for not using VIDEO_MAX_PLANES?
> 
> I'd say this is because VIDEO_MAX_PLANES does not exist outside of the Linux 
> OS, so for whatever other system we need a virtio specific definition.

OK, good reason :-)

It's probably a good thing to add a comment where VIRTIO_VIDEO_MAX_PLANES is
defined that explains this.

Regards,

	Hans
