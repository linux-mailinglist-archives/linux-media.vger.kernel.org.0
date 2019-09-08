Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED19DAD0F9
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 00:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731028AbfIHWOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Sep 2019 18:14:37 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50548 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfIHWOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Sep 2019 18:14:37 -0400
Received: from penelope.horms.nl (195-23-252-147.net.novis.pt [195.23.252.147])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C3CBB25BE0B;
        Mon,  9 Sep 2019 08:14:27 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 83FB7E215DB; Sun,  8 Sep 2019 14:20:59 +0200 (CEST)
Date:   Sun, 8 Sep 2019 13:20:59 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] rcar-vin: Define which hardware supports NV12
Message-ID: <20190908122059.llolcptapnruy5gj@verge.net.au>
References: <20190906144029.24080-1-niklas.soderlund+renesas@ragnatech.se>
 <20190906144029.24080-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190906144029.24080-2-niklas.soderlund+renesas@ragnatech.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 06, 2019 at 04:40:28PM +0200, Niklas Söderlund wrote:
> Most but not all Gen3 boards support outputting NV12, add a flag to
> indicate which boards.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

is this a board or SoC / ES version property ?


