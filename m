Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FB722B135
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 16:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgGWOYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 10:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbgGWOYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 10:24:36 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B20C0619DC
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 07:24:36 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id g26so5493364qka.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UDlKD0a4LM18XC+jOiecTAoXdOELvYejvML/RR2gdoM=;
        b=gVvm1YmQ2ooXLKJ9Vd9pgdBu19oraAs3PYAapZ3X6EIkH4hf2S2U0DlAhzDEXQE1wy
         FbkIcdEXM2DuCg/OcbC+dq47Vc9P3cuKsjJ8FigxWz0DkU1xLTmkOgsHjPnV2ph9jF/y
         udu6IgcJFF9bNq5GstN7LbdTrpeYp1EBHz/U/WIwFUKvNTfjUV7zV+qUL26UZj6+XH62
         6lB68fMp3s3YWNhYSRPB+zdPtwaIi/2OSVrFBErNIgqZ09L77zK1gUy8fkOhOolZuBx9
         nhXvZCjFxt4ugqVp/PTnbVtbccGxfb8u1jEyxjIaNfD/iD3ckgQHtGFyRslR0J5frmCN
         ArIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UDlKD0a4LM18XC+jOiecTAoXdOELvYejvML/RR2gdoM=;
        b=kbORvdzMm9nJcdxLA+N0UDDwxpx39waH/dOB+KIQdenPDBsFqlBY8JxmBeRw77gejY
         bub7mBb8Q1Hm8UAPv/u1dOnoeMrjGpawWEBPfgWnkgvwfZx8gYpXIGw3rvzCa0ytpPgd
         xAKIxWJDkElGJeMjqkNODRf1ISdH7uDoc1nGKXa1UyGAFFYnLZ3lYE9DhF9Uy3FI49rt
         JrgxJK86Wqjb2XTBtxeNl5tsXbMuM2VJKHpD1RdD5YTfYa2EaU1Z1muEdCSD4PETrVfk
         N2Xy/IoFyALEB6hffTlxF7+FYdSSndB9FwKkwEVR/nMX9GhWXsIUPfWp2tKlyLQcjxRN
         THFw==
X-Gm-Message-State: AOAM532YC0Czz5MYFOrMYBQdyhIKHZ6I1X1MY6X28jkhXROEYpMkdfhB
        WFbvyJUIavgJz4tGDOw4JuKj8w==
X-Google-Smtp-Source: ABdhPJyc56+8ywFCEReghWOeNYxWMCTOH1JImY2JUiNK7eXirK5d8TNa7OTyJAloB2MR4zbOQxzegw==
X-Received: by 2002:a05:620a:2409:: with SMTP id d9mr5622593qkn.36.1595514275626;
        Thu, 23 Jul 2020 07:24:35 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id x26sm2518595qtr.4.2020.07.23.07.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 07:24:35 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] Add support for meson building
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, sean@mess.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        kieran.bingham@ideasonboard.com, gjasny@googlemail.com,
        xavier.claessens@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        user.vdr@gmail.com
References: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
 <CAAEAJfDxtb4=NMCk8=Y=mw9-VdZ7Ag+q0D5VkyEzR4i6wHm=1Q@mail.gmail.com>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <1c48d625-c39d-8fea-6e26-0935f6793d1d@vanguardiasur.com.ar>
Date:   Thu, 23 Jul 2020 11:24:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAAEAJfDxtb4=NMCk8=Y=mw9-VdZ7Ag+q0D5VkyEzR4i6wHm=1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eze,

On 7/22/20 10:14 AM, Ezequiel Garcia wrote:
> Hi Ariel,
> 
> Thanks a lot for picking this up and pushing forward.
> 
> Do you think you can amend the README with instructions
> how to build using meson and any other relevant information
> you think would make sense?

Totally.

> 
> (I'm aware this is scope creeping, but extra points for markdown conversion).

Sure. It'll be my pleasure having that README written in markdown.

> 
> I think it would be relatively easy to do the Buildroot package port as well,
> and so we'd have Debian and Buildroot ready, which would serve
> as references.

Indeed, I've already taken a look at the Buildroot package and was about to
prepare a patch bumping it to meson, once it is merged and the next release is out.

Thanks,
Ariel
