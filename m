Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C23345A9C
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 10:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCWJRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 05:17:51 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:54645 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhCWJRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 05:17:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OdAPlvDOdUzyrOdASlOx0N; Tue, 23 Mar 2021 10:17:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616491061; bh=FIzSWrYmGhG35Z62IJlFUKny0NSOl3b3pWZhPHXRcIE=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cZs7dfOCmGhxWKO6wn5gxqJ9vvXzgZibVATZIgmwJQ5sRpPK189NxWwWwxNV46A+g
         gQDG7g1TAXmHV6M3Us9hjv0XaLMF1EIjeGQmWfFzUTCFGos6J7fmH4Wx4fTP1kTiz7
         Dh1dNGtmDfedW8UAHjYPk5U6ay/XDlCbKsc3WdwTJu7bxR+OZeeThgI71+EmunTiAh
         pDpHjCMXu5RIRcZdSwpoor5M81Xqzmvn9+3Ke6umw7K6uYPswdH0emvqHk0a/bP6Ir
         d/a0LXi/xv2rJS+HoqviTNdf6SVF/m0/yYyZuz/4ZQTnAg2r2bvy3T1+nikL1YwlLO
         Ll3WrxtpJChDA==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix these exynos4-is kernel-doc warnings?
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <03cbcdc6-01b9-339e-c95c-c184a59d1aed@xs4all.nl>
Date:   Tue, 23 Mar 2021 10:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCIYpjmH/9W82rmBQAsnPIrQ0gX/z3NoEZnQDveQbrw83D6a7uO+zjJjrQUZN78yD6EVuPO/FquPRLy/Px6sDuHWYhLIez73/wINo1PePF0P+X5L++dt
 jeQewVR2MQ2VHVhQrW6ZkZPeXJIsHyYEw8IwC3yV5sn1+pC9ccvMChBS4v4FOwkYcq0enaf/OO5HxIQhwH+epdsiTAOQOji+yJ9k5ti8gX004AHarnAcogqA
 jFuI/NKUV6csdUWJGtu+ciIBbaaI4cdKQjlYoGOfEOtDaesC5j6Kg5sZ2z4346wR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
reported by the daily build, but there are way too many, so this needs to be
fixed.

I've been cleaning up most of the exynos4-is warnings, but the warnings from fimc-is.h
require more in-depth knowledge.

Can one of you take a look at the following warnings?

drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'fw' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'memory' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'f_w' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'isp' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'sensor' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'setfile' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'ctrl_handler' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'irq' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'sensor_index' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'i2h_cmd' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'h2i_cmd' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'fd_header' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'config' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'config_index' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'is_p_region' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'is_dma_p_region' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'is_shared_region' not described in 'fimc_is'
drivers/media/platform/exynos4-is/fimc-is.h:286: warning: Function parameter or member 'af' not described in 'fimc_is'

Thanks!

	Hans
