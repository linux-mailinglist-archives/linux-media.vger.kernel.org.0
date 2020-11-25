Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D042C4977
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 22:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731040AbgKYVB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 16:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731015AbgKYVB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 16:01:58 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3564AC0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 13:01:58 -0800 (PST)
Date:   Wed, 25 Nov 2020 22:01:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606338116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xhspSoy2pdLwb2vQ4c1nije7fe9Gji9fcXvc0rPooMk=;
        b=mlprxhUjBFrNVLfb7nA4b10WST+gWcyP0oRMyTl/N8GF6ub9jDszgbqLwSy6OH2LXNLspP
        rckJfze/dAMnx4BQ8eG88uNInHOppFjMJU/eJPov5CSSmp2LtuQiawJoXGMmO7i0u/gu1D
        v2SzVnUWsWiXsBLJZ2BqME1uuwDwDHjqBzYnsXPwxVhkiBjUkKeISsfqVUkclKfZaXjv+o
        6eHXKtwLgnJqHTl6ALTkfExh+w8RjWq5WWhth5fPFVVfs5nRTCP+B0u4xN57H+AsYBvyv1
        jIFDGhauEsG68qeK1H6uyVx25Pe2gVKs80KEt5kvBHKfnh7m99T2jMVjHC2wGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606338116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xhspSoy2pdLwb2vQ4c1nije7fe9Gji9fcXvc0rPooMk=;
        b=7xV7iE+ik4oxuFVyjKCuNXCmlDCmx0uiAem3cx/RRZjPtrDgKSeisiUpS5sTVMopl4Z+/M
        YcMyODkwZtUknmAg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH REPOST] media: omap3isp: Remove misleading comment
Message-ID: <20201125210154.jcynggouhyxhy224@linutronix.de>
References: <20201113142831.2215880-1-bigeasy@linutronix.de>
 <20201116092354.GF6540@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201116092354.GF6540@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-11-16 11:23:54 [+0200], Laurent Pinchart wrote:
> Hi Sebastian,
Hi,

> Thank you for the patch.
> 
> CC'ing Sakari.
> 
> Sakari, could you please pick this one up ?

Sakari, does this work for you?

Sebastian
