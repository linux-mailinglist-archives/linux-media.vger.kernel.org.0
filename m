Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EA12297CC
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 13:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732090AbgGVL6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 07:58:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59558 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgGVL6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 07:58:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 084C0297C6F
Message-ID: <18bc849e1844d9a3955d096f41f174408e1a4d31.camel@collabora.com>
Subject: Re: [PATCH v2 0/1] Add support for meson building
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Gregor Jasny <gjasny@googlemail.com>,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com
Date:   Wed, 22 Jul 2020 08:58:07 -0300
In-Reply-To: <5598a9af-9f97-76db-eb24-6deeb05f88c1@googlemail.com>
References: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
         <5598a9af-9f97-76db-eb24-6deeb05f88c1@googlemail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-07-22 at 11:32 +0200, Gregor Jasny wrote:
> Hello,
> 
> On 7/21/20 5:14 PM, Ariel D'Alessandro wrote:
> > Hello there,
> > 
> > Here's another step on porting v4l-utils to meson build system.
> > Following the discussion thread for v1, several changes were added (see
> > Changelog below).
> > 
> > Further testing, deeper reviews, more comments, are all welcome :-)
> 
> Thanks you for polishing the patch. It looks good and the Debian package 
> properly builds.
> 
> Before merging to master the build system needs to catch-up with the 
> master branch. For example the following got added to configure.ac:
> 
> > +# Obtain git SHA of HEAD
> > +AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse HEAD ; else printf '\"not
> > available\"'; fi)"])
> > +
> > +# Obtain git commit count of HEAD
> > +AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count
> > HEAD ; fi)"])
> 
> I'm wondering if we should drop autotools shortly after the meson patch 
> was merged to prevent further drift.
> 

That would make a lot of sense, indeed.

Thanks,
Ezequiel

