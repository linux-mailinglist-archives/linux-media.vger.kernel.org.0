Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B141959E
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 01:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfEIXUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 19:20:51 -0400
Received: from gate.crashing.org ([63.228.1.57]:50809 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbfEIXUv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 19:20:51 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x49NJKg0027774;
        Thu, 9 May 2019 18:19:21 -0500
Message-ID: <9b9f9e0d8fdeef0749fa5fcef1647216e9a74f8c.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/7] media: aspeed: fix a kernel warning on clk control
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Date:   Fri, 10 May 2019 09:19:19 +1000
In-Reply-To: <bd909078-323e-93a6-143f-0bb0f0d2229c@linux.intel.com>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
         <20190502191317.29698-2-jae.hyun.yoo@linux.intel.com>
         <1ec7397cb164b40877839bbc90f79b5942675fdb.camel@kernel.crashing.org>
         <6e93467e-1556-3cfd-b15c-c12b6907f526@linux.intel.com>
         <3b4269d829467870f0b6adac18089b93114fcd3c.camel@kernel.crashing.org>
         <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
         <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
         <bd909078-323e-93a6-143f-0bb0f0d2229c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-05-09 at 10:19 -0700, Jae Hyun Yoo wrote:
> 
> Okay. Probably I need to add one another patch in this series to address
> what you pointed out.
> 
> I have one question. I reviewed again all bitops in this driver and
> checked that some bitops are protected by a spinlock and some others
> are not. In this case, can I mix use atomic and non-atomic bitops
> depend on each bitop's protection state by the spinlock? Or, would it be
> better to change all of them to bool in this case?

No, if some aren't protected by a lock and some are, then they need to
remain atomic.

The question then becomes whether the unprotected ones are actually
correct or just exposing more races.

Cheers,
Ben.


