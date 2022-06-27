Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9660555CBB9
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239025AbiF0QMz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Jun 2022 12:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239103AbiF0QM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 12:12:27 -0400
X-Greylist: delayed 1195 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Jun 2022 09:12:18 PDT
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32CE186DB
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 09:12:18 -0700 (PDT)
Received: from [192.168.10.77] (unknown [112.65.61.252])
        by kozue.soulik.info (Postfix) with ESMTPSA id 321F9100DB3;
        Tue, 28 Jun 2022 01:06:33 +0900 (JST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
From:   ayaka <ayaka@soulik.info>
Mime-Version: 1.0 (1.0)
Subject: Proposal: A third buffer type for the reconstruction buffers in V4L2 M2M encoder
Message-Id: <F81CE6D5-7081-477A-AA8D-9A9FC0228905@soulik.info>
Date:   Tue, 28 Jun 2022 00:12:12 +0800
Cc:     Randy Li <Randy.Li@synaptics.com>
To:     linux-media@vger.kernel.org
X-Mailer: iPad Mail (18D61)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All

I think we need a separate buffer queue that manages those reconstruction or auxiliary buffers for those V4L2 M2M drivers.

There are some drivers already allocating internal buffers as the reconstruction buffers for its encoding instance. The driver/media/platform/chips-media is one here, its coda_alloc_context_buf() would allocate the max allowed references for its instance as the reconstruction buffers. You can't control the lifetime of the reconstruction buffer here, which means you can't control which buffers would be as the reference.

It may look not bad for a hardware encoder that has a control chip that could do some encoding bitrate control. For those stateless encoders, which are controlled by the user completely, it would be better to let the user decide the lifetime of a reconstruction buffer.

For the SVC situation, a layer may refer to a buffer in another layer, which is encoded many times ago.

I am not sure which way is better, I would implement one from the feedback. One is reusing V4L2_BUF_TYPE_VIDEO_OVERLAY, it would support REQ_BUFS, SET_FMT, GET_FMT, QBUF, and DQBUF besides the existing m2m operations. Another idea is extending those ioctls to the media node that the stateless m2m driver uses for allocation request_fd token.

Please notice that the reconstruction could use a different pixel format than the one used in input frames. For example, Hantro H1 could use the NV12_4L4 in its reconstruction buffer and an FBC format in the later generation of chips-media's codecs.
Also, there are some decoders having an online post-processor. This means it can't do pixel format transforming independently. The driver for those devices may need this.

Sincerely
Randy
