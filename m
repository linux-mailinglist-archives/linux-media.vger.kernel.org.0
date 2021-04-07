Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77852356AB2
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 13:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245438AbhDGLAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 07:00:14 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:47379 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351775AbhDGK7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 06:59:48 -0400
Date:   Wed, 07 Apr 2021 10:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1617793177;
        bh=KJECspWceKoa/duWfXXTOMcSU5xltHyQQjQgzOtcgd0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=m0my42GxxYDfe3qBBDjj+tEiqB2CrpYdDTMHVS3uR699qis4AM07aA4bB+L6uCsx4
         j7ESLhKddZmaOGFm9Xbr6GVIuapQc7CADiqj+wiAXy52HvZqGBmuuNpGbuc/eZ6lXp
         XQcclKfCSRrvvmeuHkEsbPT6Ksd3GW4dlrbv/znx8T1TWgBEQV7lQHYcigsdh8NrU6
         Z+qa2llJtSdKLHfrh5jv+h+mGN7BtBp0eoI8v3nCRkYTlgtujGyiWf/+WMDIjty9tK
         /FBzV5ow1F2ylj8X927YV41Np4z0Q3PMWRE1SQZqrwLKQnsRaqmJdHPObUFPyapsp2
         dY1z5wV0SZuOQ==
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Simon Ser <contact@emersion.fr>
Cc:     dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: Call for an EDID parsing library
Message-ID: <DJjftAG6WNev87c34XyXFLCHe49rJBCYdqENxfO3uHXUFJXmPerOg5LuQKAbd3D_pdO34vkWgfy9uggujNI12VE-ttglyarF5wAogYC8m3E=@emersion.fr>
In-Reply-To: <20210407114404.13b41822@eldfell>
References: <20210407114404.13b41822@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FWIW, with my Sway/wlroots hat on I think this is a great idea and I'd
definitely be interested in using such as library. A C API with no
dependencies is pretty important from my point-of-view.

I'd prefer if C++ was not used at all (and could almost be baited into
doing the work if that were the case), but it seems that ship has
sailed already.

Simon
