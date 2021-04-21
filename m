Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9502366C73
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 15:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240691AbhDUNRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 09:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243263AbhDUNRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 09:17:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFE9C06174A;
        Wed, 21 Apr 2021 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=dRzGSSNRpz+eFzH2So2ubKBvMje2zZTAEujED4XgJ/A=; b=cONTAs1f8SM90mxQ+xn7aZBJEz
        ZB+5o8m2aPzm6QanM+Jrbm3O0Kh2JwvtUC6otyn/AP0ZS5PxUxHSK3jK8yFxzlRYU/w3C/Vf+EnbJ
        HgyOumHIQJ0YRrkd/XYygZoE1vE34hnc7Kd6uCW47XYJvoWpRvXbhnCbD8zwDJW6bVj7sFVS1dFg7
        8w6lXL900xGpbrXunim5UE1K7cCdXdyhum3VTvJHYt4NG0vXdsUnJW5kZnUFAeDBdcEZbcXd71WG7
        T5eucAm13curkj/KT24LbNYdehoqSQKxDPaYXpnXKN1KV1cXu/YBYZNzqc4t9tOh9N9p5h24ctKY9
        O6Dp+/Ug==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lZChO-00GYcv-1O; Wed, 21 Apr 2021 13:15:40 +0000
Date:   Wed, 21 Apr 2021 14:15:22 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210421131522.GI3596236@casper.infradead.org>
References: <20210421123718.GA4597@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421123718.GA4597@focaruja>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 09:37:18AM -0300, Aline Santana Cordeiro wrote:
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge *
> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);

As I said, better to break the 80 column rule than do this.

