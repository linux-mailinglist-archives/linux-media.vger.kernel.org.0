Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBE31F1C3E
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 17:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730264AbgFHPkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 11:40:22 -0400
Received: from ns.iliad.fr ([212.27.33.1]:57590 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729580AbgFHPkW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 11:40:22 -0400
X-Greylist: delayed 581 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Jun 2020 11:40:22 EDT
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 52BC12015F;
        Mon,  8 Jun 2020 17:30:40 +0200 (CEST)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 43C3E1FF42;
        Mon,  8 Jun 2020 17:30:40 +0200 (CEST)
To:     linux-media <linux-media@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Scanning for TV channels over DVB-T and DVB-T2
Message-ID: <11fbc112-c410-8c67-9bcb-9450924d12ef@free.fr>
Date:   Mon, 8 Jun 2020 17:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jun  8 17:30:40 2020 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Suppose we know that several channels are transmitted on a given frequency
by terrestrial antenna. However, we don't know if the signal is "encoded"
(not sure this is the right term) in DVB-T or DVB-T2 modulation.

Do we have to scan the frequency /twice/
first with DTV_DELIVERY_SYSTEM = SYS_DVBT
 then with DTV_DELIVERY_SYSTEM = SYS_DVBT2 ?

Or is there some optimization where both modulations are handled
in a single step?

Or maybe it depends on the tuner driver?

Regards.
