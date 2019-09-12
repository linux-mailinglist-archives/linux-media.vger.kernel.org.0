Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369AEB09B2
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 09:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfILHsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 03:48:17 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57143 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728296AbfILHsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 03:48:17 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8JpriAUTbQUjz8Jpvi8hEX; Thu, 12 Sep 2019 09:48:15 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
Message-ID: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
Date:   Thu, 12 Sep 2019 09:48:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP1JWJDfaMVBOW2EOLv9XU8URxFAWWwdt9qxP2Abz9/cdvuzjHoKj5TbMKROuqkyfsEqco0dLGtJxgCw7T5UnHJyPB+LhIZfn4DKf0h2yEfB1zhru693
 6KtMoc5vkJxY6gZF64fvqJ9silZ8MZ84ViUHxA1dt+YgclhEwaz9+e0F2WQCa65RUyhxAM6VrY0fJw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I am increasingly unhappy about the choice of /dev/videoX for metadata devices.

It is confusing for end-users (especially w.r.t. the common uvc driver) and
if we want to change this, then we need to do it soon.

This patch https://patchwork.linuxtv.org/patch/58693/ adds a new VFL_TYPE_METADATA
so at least drivers can now explicitly signal that they want to register a
metadata device.

This also makes it possible to add a kernel config option that allows you
to select whether you want metadata devices to appear as videoX or v4l-metaX.
I would prefer to set it to v4l-metaX by default.

We can also consider backporting this to the stable/long-term kernels.

Metadata capture was introduced in 4.12 for the vsp1 driver, in 4.16 for the
uvc driver and in 5.0 for the staging ipu3 driver.

Does someone remember the reason why we picked /dev/videoX for this in the
first place?

Regards,

	Hans
