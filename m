Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49BC688FBD
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 07:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjBCGfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 01:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjBCGfE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 01:35:04 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EDF4200;
        Thu,  2 Feb 2023 22:35:03 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 57D1F68C4E; Fri,  3 Feb 2023 07:35:00 +0100 (CET)
Date:   Fri, 3 Feb 2023 07:35:00 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "Dr. David Alan Gilbert" <dave@treblig.org>, iommu@lists.linux.dev,
        mchehab@kernel.org, hch@lst.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Regression: v4l/bttv vbi vs iommu
Message-ID: <20230203063500.GA23520@lst.de>
References: <Y9qSwkLxeMpffZK/@gallifrey> <d363902d-e465-8411-0c1e-58411b3a19b0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d363902d-e465-8411-0c1e-58411b3a19b0@xs4all.nl>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 01, 2023 at 09:48:46PM +0100, Hans Verkuil wrote:
> In fact, the plan is to replace the old and deprecated videobuf framework by the vb2
> framework in the bttv driver in the next 2-3 months or so. That will also automatically
> solve this problem.

It would be great to expedite removal of the old videbuf code given
how many problems it has.
