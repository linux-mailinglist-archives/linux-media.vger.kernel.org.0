Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EB06B674D
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 15:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjCLOtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 10:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjCLOtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 10:49:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CB031E20
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 07:49:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-21-162-nat.elisa-mobile.fi [85.76.21.162])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B45BF814;
        Sun, 12 Mar 2023 15:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678632541;
        bh=nyfZ+AToNpZeyyIx6oPT87hiKowBr0WpY61oatzJvAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YCRUUpgYm/JeF3EuxOyFWLLHy+zCFZMEDgZXvg+xEqq5XfTYPH+L7LU1NZkrB58Rk
         FQcySR2B9CKbqYg7pduyrz+1ZhfLAVF+bYWjH5ZW2szL24xBKAmDu2nbb8iwCePFQM
         pkmRBiBcqGIIL99SIEGTRiBW+I58BAKZK/AtwOcg=
Date:   Sun, 12 Mar 2023 16:49:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Message-ID: <20230312144903.GO2545@pendragon.ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Sun, Mar 12, 2023 at 03:31:29PM +0100, Gregor Jasny wrote:
> Hello,
> 
> while packaging the v4l-utils master branch for the Ubuntu PPA[1] I 
> noticed two issues:
> 
> On 23.02.23 17:44, Laurent Pinchart wrote:
> > +dep_libbpf = dependency('bpf', required : get_option('bpf'), version : '>=0.7')
> > +if not dep_libbpf.found()
> > +    dep_libbpf = cc.find_library('bpf', has_headers: 'bpf/bpf.h', required : get_option('bpf'))
> > +endif
> 
> Ubuntu Jammy contains libbpf 1:0.5.0-1ubuntu22.04.1. Therefore the first 
> dep_libbpf check fails due to the version constraint. But the second 
> check for the header succeeds. Afterwards the build fails due to the too 
> old libbpf.
> 
> What's the reason for the fallback? I guess new enough versions of 
> libbpf always ship a pkgconfig file.

autoconf didn't have any fallback as far as I can tell, so I think we
could drop it here too. As I can't easily test this on Ubuntu, would you
be able to send a patch ?

> > +git_sha = run_command(prog_git, '-C', meson.project_source_root(), 'rev-parse', '--short=12', 'HEAD',
> > +                      check : true).stdout().strip()
> > +conf.set('GIT_SHA', git_sha)
> > +git_commit_cnt = run_command(prog_git, '-C', meson.project_source_root(), 'rev-list', '--count', 'HEAD',
> > +                             check : true).stdout().strip()
> > +conf.set('GIT_COMMIT_CNT', '-' + git_commit_cnt)
> > +git_commit_date = run_command(prog_git, '-C', meson.project_source_root(), 'show', '--quiet',
> > +                              '--date=format-local:%F %T', '--format=%cd',
> > +                              env : ['TZ=UTC'], check : true).stdout().strip()
> > +conf.set('GIT_COMMIT_DATE', git_commit_date)
> 
> In Debian / Ubuntu we built from a published tarball (created by meson 
> dist). It does not contain a .git directory and therefore those checks fail.
> 
> I created a patch to work-around the issue:
> https://git.launchpad.net/~libv4l/+git/v4l-utils-packaging/tree/patches/conditional-git-ops.diff
>
> But I'm not too fluent in Meson, yet.

You're doing quite fine :-) The patch looks good, except for

if fs.is_dir('.gitd')

which should be '.git' unless there's something I'm missing. Will you
submit the patch to the linux-media mailing list ?

> [1] https://code.launchpad.net/~libv4l/+recipe/v4l-utils-master

-- 
Regards,

Laurent Pinchart
