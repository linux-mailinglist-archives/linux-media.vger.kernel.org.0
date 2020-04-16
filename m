Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17491ABC88
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503798AbgDPJPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:15:13 -0400
Received: from gofer.mess.org ([88.97.38.141]:33281 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440692AbgDPIKr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:10:47 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0F56611A002; Thu, 16 Apr 2020 09:10:26 +0100 (BST)
Date:   Thu, 16 Apr 2020 09:10:26 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: Re: [PATCH] Removed nested functions to support building with clang
Message-ID: <20200416081026.GA13705@gofer.mess.org>
References: <20200416075837.13363-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416075837.13363-1-sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 16, 2020 at 08:58:36AM +0100, Sean Young wrote:
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  utils/common/ir-encode.c | 336 ++++++++++++++++++++-------------------
>  1 file changed, 170 insertions(+), 166 deletions(-)

Sorry, this is broken. I missed out the changes to utils/common/bpf_encoder.c


Sean
