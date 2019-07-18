Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6209A6CDAF
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 13:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfGRLwz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 07:52:55 -0400
Received: from ns.iliad.fr ([212.27.33.1]:41644 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726715AbfGRLwz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 07:52:55 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id BAD4C20618;
        Thu, 18 Jul 2019 13:52:53 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id A84F72070A;
        Thu, 18 Jul 2019 13:52:53 +0200 (CEST)
Subject: Re: [PATCH 2/3] media: Add lane checks for Cadence CSI2TX
To:     Jan Kotas <jank@cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
 <20190718111509.29924-3-jank@cadence.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <0fea09d4-1e8a-b9bf-b549-ee7cd72bd814@free.fr>
Date:   Thu, 18 Jul 2019 13:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718111509.29924-3-jank@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul 18 13:52:53 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/07/2019 13:15, Jan Kotas wrote:

> This patch adds line checks for CSI2TX, to prevent
> clock lane being used as a data lane.

"line checks" or "lane checks? ^_^

NB: commit messages may be up to 72-character-wide ;-)
(No need to line-wrap at 50)

Regards.
