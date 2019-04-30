Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9836F9CC
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 15:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfD3NUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 09:20:31 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46396 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbfD3NUb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 09:20:31 -0400
Received: by mail-lj1-f196.google.com with SMTP id h21so12724409ljk.13
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GxUTvEwj+NBZpurZ2Ig0gOAGnCDy3ToJRSMidXZgrwA=;
        b=nbHTatfrSBU52QO6/XAOdHj9n3sbWKACiGEOroIP1njriZJp1154c0zcMmUOEddftb
         RHJG5EOjKR045xHsmGwBRk25Zpt4plyqn/QjXipfndHY4PBSZlr5wG+o+/JwaTTPxM2T
         MhoVB9YsVgacvd6KF90nDt0wxErlKPxttItAjzHqChSUXtBUcL7DiCOtUiI8jtGV7l9u
         /GRXc024g7onhK63Wn5BuFgcj1Jpq59TJA3MVz5rJv+nnUP5E3LhdOkx2Z1fDCT5B/Ez
         8uTClrIbXDUjeJm3JKcRdmGlroD9T1vDJT8AYsYZwtLLO5K78rkzLewM9joqBiOrcpzh
         wTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GxUTvEwj+NBZpurZ2Ig0gOAGnCDy3ToJRSMidXZgrwA=;
        b=bze7oxTL/9/LPnrwtrEqo37Op8hvRxfMX0gDbsgLnWjFRAUJq3KktHfvIcFgGKagnU
         2J9f3P+GpoBWOUP3U5Lk9Y0YSK6n46Y6pg9/cvXEC2vV+TGUUOWAEoUbAaQXyB6aCWBT
         lTyu1SEFMDnfYQTxxFBrEzrcrjS/avYJ5QBXue6piXeJqT4PYe6M0G8boC4U+LDxE8oh
         LBEVtivKBnPa+2FY0lUZfC5UsIUZFt3eayt4SQNXdDBbt0hFghkyySApZ9kslMwoUHUu
         mATNh6KvVUCZH3+E6t6BIIyW+P0PMokeCg/OuBMGpx5QnPf4VscAA8DqU6AYtUdAbk8Y
         6+0A==
X-Gm-Message-State: APjAAAWZzghTBs89jZ65NQq6Q+tqamwVge9ckRMuwHzax1wfYkr5w9F3
        vt3yuOiEEeFbq/3vZprfj2W6WuC0FiZ1GQ9inRjixw==
X-Google-Smtp-Source: APXvYqz6/C5cOSAi+LjOLFLkuA/ISsQ8fKMilHFI35qQ0Q11aqKw0onTyfbnQdSYNfhdSjCiVudD/DPj+qhrxqtjTUA=
X-Received: by 2002:a2e:3a0f:: with SMTP id h15mr35417830lja.194.1556630428902;
 Tue, 30 Apr 2019 06:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuZhS+QfgM0HrNm4B8Yb+0kwScxaURJDYXKPY-ML_L0cQ@mail.gmail.com>
 <35ebc45a-5894-e2ab-3a97-2ce3f7efda44@xs4all.nl>
In-Reply-To: <35ebc45a-5894-e2ab-3a97-2ce3f7efda44@xs4all.nl>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 30 Apr 2019 18:50:17 +0530
Message-ID: <CA+G9fYuTpeu1MdLVe3ZNp3Bvx0c79mXwh2qun5MWseEweRO=FQ@mail.gmail.com>
Subject: Re: vidioc_g_edid: BUG: Unable to handle kernel NULL pointer
 dereference at virtual address 00000716
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, 30 Apr 2019 at 12:58, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 4/30/19 9:10 AM, Naresh Kamboju wrote:
> > v4l2-compliance test running on linux stable 4.9 reported kernel bug.
> > The crash is pointing to kernel module "vivid.ko" which was loaded by
> > test case. (  modprobe vivid.ko)
> >
> >
>
> It's a CEC related bug, this vivid patch should fix it. It's a backport of
> commit ed356f110403 ("media: vivid: check if the cec_adapter is valid"). This
> commit was only backported to 4.12 and up since it didn't apply to older kernels.

I have tested this patch on x86_64 and confirms this works.
v4l2-compliance test runs to complete successfully.


>
> Feel free to post this patch (after testing!) to the stable mailinglist for
> inclusion into 4.9.

I will post this patch on stable mailing list.

>
> Regards,
>
>         Hans
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> --- a/drivers/media/platform/vivid/vivid-vid-common.c   2019-04-30 09:23:37.296797292 +0200
> +++ b/drivers/media/platform/vivid/vivid-vid-common.c   2019-04-30 09:24:09.581261759 +0200
> @@ -841,6 +841,7 @@
>         if (edid->start_block + edid->blocks > dev->edid_blocks)
>                 edid->blocks = dev->edid_blocks - edid->start_block;
>         memcpy(edid->edid, dev->edid, edid->blocks * 128);
> -       cec_set_edid_phys_addr(edid->edid, edid->blocks * 128, adap->phys_addr);
> +       if (adap)
> +               cec_set_edid_phys_addr(edid->edid, edid->blocks * 128, adap->phys_addr);
>         return 0;
>  }


Best regards
Naresh Kamboju
