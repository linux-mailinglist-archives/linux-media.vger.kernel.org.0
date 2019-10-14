Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB998D5E18
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 11:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730655AbfJNJF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 05:05:57 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40363 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730605AbfJNJF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 05:05:56 -0400
Received: from [IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d] ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JwIbiFitLop0AJwIcidIyA; Mon, 14 Oct 2019 11:05:54 +0200
To:     Florian Echtler <floe@butterbrot.org>,
        Nick Dyer <nick@shmanahar.org>
Cc:     Vandana BN <bnvandana@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Userspace support libraries for touch pad devices?
Message-ID: <0573a188-5f5c-d14c-3d38-e1d82e30f9f8@xs4all.nl>
Date:   Mon, 14 Oct 2019 11:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC2r3luijDdRQNcF9ZPttSvB4zPwIMkktPiYbYOJyEy4o9lDpRQtfXPn+O0KumrMJB8i+E1GgoRLW0nvvwlvHe9rnXBzAPdSu/OWMpHwUE2zp1kpvkBr
 ppIc1GUjtC6ocJ8s9Bxj35cgEm7qX1JrVCb/8SeV+9tyGQDa93cknSrXw41ho7/ftie5mYO70v7VH1MeJSKiVoxiC7OkYvUrogPEYs3NLHZNieKne2ffstgs
 F+DBvq2cJGmGZthpbds9Nkol4Ac9Qio4e7Me8hCVK6XLv8YUIrZxkouXdpwKrD7saO9meSuDDFMDKzkyCmBerlHaIL5o2DMJ9Db6hN6BuK4+ZNWT/OTaAaFJ
 q1VrRZklO0oPROax2YaKUHqGTtivMA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Florian, Nick,

You both added V4L2 touch pad drivers to the kernel, but I was wondering
about userspace support for such devices. Is there a library somewhere that
can interpret the data?

The only link I found is https://github.com/ndyer/heatmap/commits/heatmap-v4l
but that appears to be mostly a test utility.

Vandana is adding touch device emulation to the vivid driver, so it would be
interesting to see if a library exists for such devices to simplify testing.

Regards,

	Hans
