Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D2B4B369A
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237547AbiBLQt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Feb 2022 11:49:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbiBLQtz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Feb 2022 11:49:55 -0500
X-Greylist: delayed 133 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Feb 2022 08:49:51 PST
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FD32409F;
        Sat, 12 Feb 2022 08:49:51 -0800 (PST)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net [108.7.220.252])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21CGkxsP010096
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 12 Feb 2022 11:47:00 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id 1847215C0040; Sat, 12 Feb 2022 11:46:59 -0500 (EST)
Date:   Sat, 12 Feb 2022 11:46:59 -0500
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     Qing Wang <wangqing@vivo.com>
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH V2 00/13] use time_is_xxx() instead of jiffies judgment
Message-ID: <Ygfkg0n6RvvJYMJa@mit.edu>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 10, 2022 at 06:30:23PM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> It is better to use time_is_xxx() directly instead of jiffies judgment
> for understanding.

Hi Wang,

"judgement" doesn't really make sense as a description to an English
speaker.  The following a commit desription (for all of these series)
is probably going to be a bit more understable:

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Cheers,

						- Ted
