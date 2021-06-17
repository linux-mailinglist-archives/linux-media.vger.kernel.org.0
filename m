Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22D63AAE89
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 10:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFQIQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 04:16:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39315 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229915AbhFQIQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 04:16:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tnA5l1seJhqlttnA8lzb0c; Thu, 17 Jun 2021 10:14:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623917648; bh=3rs1YVhDUh4QBfnTBGiB3mwKiOKJQkezRyOR33v0bDA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bakV4PtFOxiyGoq6YCL2jaOh2R8O4xOvrV0ySQnWfiOvDzgLMOxk58l+xWrhZIVBQ
         Jh/gKVfA/jyRydFkpcQpThU/KwM/OSRG9bU5M/CQ0yLkGElNT0yXfXO25PZlUBOlZc
         p3Cneileqcsdda0Ge9a8ueHwhP1THe1Fo0UW0lF5gxcV0Z64DthWY0zERRQ4j0Jpsw
         gLG1h1pIdKIAKC1EMX1AWhppp44gXW4smMfW02z3c9p2t6jjnHSipfTgtR2IAHjLgc
         H9sInG+rPD9CSt7h38K+das4CnQyQM05DYTGNXVShIHrGFMULK0tS5Ip3T3lR4fXnh
         +gcFo2c5b6vZw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     jacopo mondi <jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] v2: gmsl: Reliability improvements
Message-ID: <3569db8d-a46d-fa03-c396-4040387d34d2@xs4all.nl>
Date:   Thu, 17 Jun 2021 10:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKShekAKTl8jX+O9kxEMI+9G2h8UAd1Zykkmxn6nn+3Nm3Mx/8rrHEiSJOXS4frYa3X84ET+k1aOAa85OjVF4uYnl1q+PKt3x18wOusGsahN7iXK8QsT
 hAZ4In9SyoLHJx5LhOZA8c8hmog09h3ruDIuIk/BLYceaTNr/F8YCfhZF1ZYcpuOVFwWuC/4ksWc8EfO6GVhOn1zToBsjEc9ErMkv4kyrgFqt+C3voACr9oL
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1 of this PR:

- swapped patches 11 and 12 to prevent bisect breakage
- added Kieran's Reviewed-by to patch 10.

The following changes since commit 45040f675041956ad763f9ef139ecee3647aa8bb:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-08 16:13:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14p

for you to fetch changes up to 7e6fab1a4eba9f49b89bad704c93e140190a5cd6:

  media: i2c: rdacm20: Re-work ov10635 reset (2021-06-17 10:11:06 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (15):
      media: i2c: max9286: Adjust parameters indent
      media: i2c: max9286: Rename reverse_channel_mv
      media: i2c: max9286: Cache channel amplitude
      media: i2c: max9286: Define high channel amplitude
      media: i2c: max9286: Rework comments in .bound()
      media: i2c: max9271: Check max9271_write() return
      media: i2c: max9271: Introduce wake_up() function
      media: i2c: rdacm21: Add delay after OV490 reset
      media: i2c: rdacm21: Fix OV10640 powerup
      media: i2c: rdacm21: Power up OV10640 before OV490
      media: i2c: rdacm20: Embed 'serializer' field
      media: i2c: rdacm20: Enable noise immunity
      media: i2c: rdacm20: Report camera module name
      media: i2c: rdacm20: Check return values
      media: i2c: rdacm20: Re-work ov10635 reset

 drivers/media/i2c/max9271.c | 42 +++++++++++++++++++++++++++++++-------
 drivers/media/i2c/max9271.h |  9 ++++++++
 drivers/media/i2c/max9286.c | 41 ++++++++++++++++++++-----------------
 drivers/media/i2c/rdacm20.c | 84 ++++++++++++++++++++++++++++++++++++++++++++-------------------------------
 drivers/media/i2c/rdacm21.c | 67 +++++++++++++++++++++++++++++++++++++++++-------------------
 5 files changed, 161 insertions(+), 82 deletions(-)
