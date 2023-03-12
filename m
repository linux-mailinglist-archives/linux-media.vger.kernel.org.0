Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF51E6B6729
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 15:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCLObf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 10:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjCLObe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 10:31:34 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698B34FAA8
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 07:31:33 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o12so38920151edb.9
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678631492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvvhC5eT30rICTvXhVb8eRdJL7IwI9nAof0b3X7qjCA=;
        b=ifoIuqKf188gRALyahR7RZIhfaO++ierAIxlX05d72q6ajjLeA6YTreu+NCyYS/UbR
         G7R0qTVIXt6cFAban35+nCZOrtqYtIXYGi73WBucRombh8nYMEqkFLuhC1TwmLtH6v9S
         Ihl0OCmDNeLXF5cSR2ec2AfmDPc6mp/GAbeOp67oIcWUbkT3YOpDfHhkkk5myQn6XPNh
         3CnpQV9sAEIU4XGl9gtOtRu7opzfu1Nh15x8lJ0r5Ic9gT3D6btWfFd9NpDXqhpvrgCH
         okyB4F4ifHqrVViZfZ89ywTwnfj4uGC6NEBuuXl+/7GOy5w2po15zvCMHCnNXCDdhmlM
         yJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678631492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvvhC5eT30rICTvXhVb8eRdJL7IwI9nAof0b3X7qjCA=;
        b=VOpYiy6b0ukmHhgRvJ75NC4VSV8OLHtOnpVc5roZYNaXj7iLsymMsK+emtL7tRpB0d
         CmxPzA7pfZjM0ZpooPK7Y99GKr7gY6JSX96OvXek0uhcEpbALznsQG9ATHna3mKMYpT8
         ePsg1Mpal01JglXBvsIUPCsblL3ZV2mrjnubN8B0/7/2Sh+EqgbA2QI2YGJ1kj1pqVQ4
         9MRKMygp9DWHHT3SYTBGH/AasxuLQswN0Kb0cVqdugPCljcsTrflx/2zb0YMeKJLYu8u
         SrL32cpYZf+hMDHmvuWwi0Io8ueY0KoH1YQ44x/PeafDGKTc3H04m10YTBQ/VaE1Y71i
         TIOQ==
X-Gm-Message-State: AO0yUKUA9r9I76GMauVKGiDOrImpyAYOue8El03Xg1yy1YEyx2F1VSfT
        ZT4AfvA+U7vUzbzgyNi6hN8=
X-Google-Smtp-Source: AK7set/jQ7ye3G8TnqGnnJJKXI6JdLtykve9mcACnJvfGO8t28HRKp/8JEMkXu+zzYeQEEVA0/fY5w==
X-Received: by 2002:a17:906:4c8e:b0:8af:447a:ff8e with SMTP id q14-20020a1709064c8e00b008af447aff8emr28568651eju.20.1678631491650;
        Sun, 12 Mar 2023 07:31:31 -0700 (PDT)
Received: from [192.168.0.125] (ip5f5a5b70.dynamic.kabel-deutschland.de. [95.90.91.112])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090685cb00b008b11ba87bf4sm2259117ejy.209.2023.03.12.07.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 07:31:31 -0700 (PDT)
Message-ID: <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
Date:   Sun, 12 Mar 2023 15:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

while packaging the v4l-utils master branch for the Ubuntu PPA[1] I 
noticed two issues:

On 23.02.23 17:44, Laurent Pinchart wrote:
> +dep_libbpf = dependency('bpf', required : get_option('bpf'), version : '>=0.7')
> +if not dep_libbpf.found()
> +    dep_libbpf = cc.find_library('bpf', has_headers: 'bpf/bpf.h', required : get_option('bpf'))
> +endif

Ubuntu Jammy contains libbpf 1:0.5.0-1ubuntu22.04.1. Therefore the first 
dep_libbpf check fails due to the version constraint. But the second 
check for the header succeeds. Afterwards the build fails due to the too 
old libbpf.

What's the reason for the fallback? I guess new enough versions of 
libbpf always ship a pkgconfig file.

> +git_sha = run_command(prog_git, '-C', meson.project_source_root(), 'rev-parse', '--short=12', 'HEAD',
> +                      check : true).stdout().strip()
> +conf.set('GIT_SHA', git_sha)
> +git_commit_cnt = run_command(prog_git, '-C', meson.project_source_root(), 'rev-list', '--count', 'HEAD',
> +                             check : true).stdout().strip()
> +conf.set('GIT_COMMIT_CNT', '-' + git_commit_cnt)
> +git_commit_date = run_command(prog_git, '-C', meson.project_source_root(), 'show', '--quiet',
> +                              '--date=format-local:%F %T', '--format=%cd',
> +                              env : ['TZ=UTC'], check : true).stdout().strip()
> +conf.set('GIT_COMMIT_DATE', git_commit_date)

In Debian / Ubuntu we built from a published tarball (created by meson 
dist). It does not contain a .git directory and therefore those checks fail.

I created a patch to work-around the issue:
https://git.launchpad.net/~libv4l/+git/v4l-utils-packaging/tree/patches/conditional-git-ops.diff

But I'm not too fluent in Meson, yet.


Thanks,
Gregor


[1] https://code.launchpad.net/~libv4l/+recipe/v4l-utils-master
