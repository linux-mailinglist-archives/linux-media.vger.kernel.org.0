Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F749346195
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 15:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhCWOfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 10:35:04 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58263 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232263AbhCWOel (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 10:34:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Oi78lrRqzCAEGOi7BlXSQp; Tue, 23 Mar 2021 15:34:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616510077; bh=1eag1HUSmWmLPG0YluCsZtGgPF557CaBXt2OF2ST/G8=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ODTZD2/KLvSduCwvARw0/ILajQGtXVQfql3RVcQ3X8ZUQbE/1aRVGsAjJYr0BPMts
         eixd+WcBI5YJbeHa0etnHxGPHmVpT2ikloBNO1aQR2LYzrR5+BUIZYzMFzDPO1BdSS
         PKe0GsNUYYrKKjdNfLbz9M2LOGWhOnE9YgXCLh02+ScjyCTv3+t04nrwz80jIjhw4u
         kp2pyLEkHJ6tFHabWlOSqXn+sPhKrgF1QrrCKJYonuvi9hfFgQw1F3f3KTFllVE+he
         sFCuRxXzZkfjHJugEcCR0Riw3jbzd/Ze7/23k6/lihJl7fLPYQBjgKCK1OdpNzvizW
         JQZEkySDRVubw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix these remaining s5p-mfc kernel-doc warnings?
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <f5044fff-fe9a-f53b-201d-32cea6455d8d@xs4all.nl>
Date:   Tue, 23 Mar 2021 15:34:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLIMZuvx2VrGK8TDs7Q96m3DZM9Tz3Y7hb5PsnjkJVIfdjlEpzXzU2jWU3d+I3wy3sEOBFKArU1JzbCmSkImptPF5HHkLmtTROLYFliUNLQ+uHdDZkS7
 LQGvefZRjUqh9kYGbScnrX3a2buPBddOvXuCK7BrPLdIwdJGjKClLMkNYwk4Oc8uhoT7eI0Bly3qWzexqIZAdgxjjHIsFhY4u+CtkzUMAgLi/zFPVLeXUsml
 tvbkgCfHVBJvJjbAcGxpgfDDGtrSOlDGHTS55GSxymVDV2yOzQnlRrCIOY6ApsJx
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

After applying this patch:

https://patchwork.linuxtv.org/project/linux-media/patch/bc9e52c2-94b9-f667-2013-9b7793fce8f9@xs4all.nl/

most of the kernel-doc warnings in s5p-mfc/s5p_mfc_common.h are resolved, but there
are still a bunch left that someone with a bit more knowledge should look at.

Can one of you take a look at the following warnings?

drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'fw_buf' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'mem_size' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'mem_base' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'mem_bitmap' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'mem_virt' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'dma_base' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'watchdog_timer' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'fw_get_done' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:343: warning: Function parameter or member 'risc_on' not described in 's5p_mfc_dev'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'src_bufs_cnt' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'dst_bufs_cnt' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'pb_count' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'force_frame_type' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'slice_mode' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'slice_size' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'frame_tag' not described in 's5p_mfc_ctx'
drivers/media/platform/s5p-mfc/s5p_mfc_common.h:714: warning: Function parameter or member 'scratch_buf_size' not described in 's5p_mfc_ctx'

Thanks!

	Hans
