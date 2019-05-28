Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9862C2EE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 11:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfE1JSc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 05:18:32 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55403 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725943AbfE1JSc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 05:18:32 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VYFZhh8VhsDWyVYFahcRZ2; Tue, 28 May 2019 11:18:30 +0200
Subject: Re: [RFCv1 00/12] media: mtk-vcodec: support for MT8183 decoder
To:     Alexandre Courbot <acourbot@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190528055635.12109-1-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f143b2e2-45ab-9d59-a607-f2032206e4e0@xs4all.nl>
Date:   Tue, 28 May 2019 11:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMM8dvHjwzwUAfKnKoP8luEtEGaVf32kshxDabImXd9jy0WyZNQu0oWcDuCA15v9nj/65NQVATJO4tPv31EblnvNkBcLyM0GlUCHRM2mkscgsxSaiswR
 z+uWhE+HAnoTjmtUpDFDsRwqLldLpm10GCvThGRZS9AwpB6rYzpOoJACHAi+y7ayANPTsKM8eXP10lvHUMh3XG3vFDJmZyk+ZKi4hili3Ha6LsQVHdZ1Kq3v
 vKz7PBFkC289Svxv/UAK1HyqfzxsmMyvf3hgblMRlP6QCjItw2KzTaQuDPaDKe25huRnygLIgRxG5gND9j3oXY1Z1GJ8dz7N4yXj4S9m59bZfu7ZZABtfHe3
 xnEJWDQZmDvZFYRZWNECTI8f1mrue7Twz7xEv+XgXHHNARAg5dowSUiLwU3VaLo7hq3660hThRLml4Z47FJzmQHHI23PFddGlMShAwD4IcU9WP0Gm3pZagt5
 uj3w07yiQs3Z5ISYUg9Ic/KY+HpW5qmmXcqyIeQwT3ro8nPkQ5zdw8Ifphm4h2EKGIXgHZae/WMch5Sz9rDGyVUtTyRv4tUkPXalEvIEwlgMP4zknzhckwVy
 kYI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> This series is a refactoring/split of the initial patch for MT8183 codec support
> that was posted for Chrome OS [1] in order to make it upstreamable.
> 
> The line count has been significantly reduced compared to the initial patch,
> although support for the MT8183 encoder is not here yet to limit the amount of
> code to review.
> 
> Although the series applies on top of today's media tree, it will not compile
> until support for the SCP is merged, hence the RFC status. Note also that the
> H.264 structures used and implementation of the stateless codec API may not be
> completely up-to-date. So the goal of this publication is to review the general
> idea (especially split unto stateful and stateless ops), and maybe merge the
> first 5 patches.
> 
> Patches 1-5 are cleanup/small fixes that came while working on this series. They
> should be harmless and can be merged.

Merging these makes sense. I should be able to do that when v2 is posted with the
SPDX conversion.

Regards,

	Hans
