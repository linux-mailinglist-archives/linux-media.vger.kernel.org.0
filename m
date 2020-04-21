Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEDA1B2886
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgDUNwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:52:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34166 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUNwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:52:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6D72F2A174F
Message-ID: <93a4663d03046abd984382f898de15ad2a97cd4e.camel@collabora.com>
Subject: Re: [PATCH v4] dt-bindings: rockchip-vpu: Convert bindings to
 json-schema
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        mark.rutland@arm.com, robh@kernel.org
Date:   Tue, 21 Apr 2020 10:52:33 -0300
In-Reply-To: <30717aac-f589-ffbd-aefb-07c2934f7a2e@xs4all.nl>
References: <20200326191343.1989-1-ezequiel@collabora.com>
         <12f6d7cf-6af6-4f54-3188-65e73b703a72@gmail.com>
         <9328212d-139f-6a0e-7d0c-3a5529a392f2@gmail.com>
         <30717aac-f589-ffbd-aefb-07c2934f7a2e@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-04-21 at 15:44 +0200, Hans Verkuil wrote:
> On 21/04/2020 15:19, Johan Jonker wrote:
> > Hi,
> > 
> > Question for the media maintainers Hans & Co. :
> > 
> > What's nxp,imx8mq-vpu.yaml doing under rga?
> > Why is rockchip-vpu.yaml inserted under rga instead of vpu?
> 
> That's clearly wrong. Probably my fault when trying to resolve
> a conflict.
> 
> Ezequiel, can you make a patch fixing this? It's probably a good
> idea if you double-check these entries to make sure I didn't inadvertently
> introduce more mistakes.
> 

Sure, no worries.

Ezequiel

