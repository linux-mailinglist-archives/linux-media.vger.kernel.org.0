Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81BD2776A9
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 18:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgIXQZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 12:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgIXQZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 12:25:20 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F4DC0613CE
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 09:25:20 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 85F942CB;
        Thu, 24 Sep 2020 16:25:19 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:25:16 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: docs: make CEC documents compatible with
 Sphinx 3.1+
Message-ID: <20200924102516.5793f792@lwn.net>
In-Reply-To: <4dce88f0cb555c79f71006bf9e62e209144762bb.1600963096.git.mchehab+huawei@kernel.org>
References: <cover.1600963096.git.mchehab+huawei@kernel.org>
        <4dce88f0cb555c79f71006bf9e62e209144762bb.1600963096.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 24 Sep 2020 18:21:46 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> -:c:func:`close() <cec-close>` returns 0 on success. On error, -1 is returned, and
> +:c:func:`close()` returns 0 on success. On error, -1 is returned, and

So while you're at it, it seems like all the :c:func: markups could come
out, right?

Thanks,

jon
