Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0865824C087
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 16:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgHTOXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 10:23:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbgHTOXu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 10:23:50 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F400820738;
        Thu, 20 Aug 2020 14:23:48 +0000 (UTC)
Date:   Thu, 20 Aug 2020 10:23:47 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Message-ID: <20200820102347.15d2f610@oasis.local.home>
In-Reply-To: <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
        <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 20 Aug 2020 17:14:12 +0800
Nicolas Boichat <drinkcat@chromium.org> wrote:

> Technically, we could only initialize the trace_printk buffers
> when the print env is switched, to avoid the build error and
> unconditional boot-time warning, but I assume this printing
> framework will eventually get removed when the driver moves out
> of staging?

Perhaps this should be converting into a trace event. Look at what bpf
did for their bpf_trace_printk().

The more I think about it, the less I like this series.

-- Steve
