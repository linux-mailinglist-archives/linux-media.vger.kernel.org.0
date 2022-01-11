Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C59B48A918
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 09:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348810AbiAKIKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 03:10:34 -0500
Received: from verein.lst.de ([213.95.11.211]:41416 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348808AbiAKIKe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 03:10:34 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5431468AFE; Tue, 11 Jan 2022 09:10:30 +0100 (CET)
Date:   Tue, 11 Jan 2022 09:10:30 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, kernel@collabora.com
Subject: Re: [PATCH 2/3] media: stk1160: move transfer_buffer and urb to
 same struct 'stk1160_urb'
Message-ID: <20220111081030.GA21713@lst.de>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com> <20220111065505.6323-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111065505.6323-3-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The overly long lines make this pretty unreadable.
