Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C13AD9049
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfJPMC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:02:29 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:49914 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfJPMC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:02:29 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iKi0Y-0004F3-0O; Wed, 16 Oct 2019 14:02:26 +0200
Date:   Wed, 16 Oct 2019 14:02:25 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 30/34] media: cec-gpio: Use CONFIG_PREEMPTION
Message-ID: <20191016120225.bi6zyewpruvmxlnl@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-31-bigeasy@linutronix.de>
 <6897ccdb-e2b7-7739-e6b9-872306895a4f@xs4all.nl>
 <23950aea-3972-64fd-9493-d7f9f81db9d2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23950aea-3972-64fd-9493-d7f9f81db9d2@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-10-16 13:51:14 [+0200], Hans Verkuil wrote:
> Do you want me to take this patch? Just checking.

It is up to you. You have all the dependencies so you can either add it
to your -next branch or leave it and we will pick it up for you.

> Regards,
> 
> 	Hans

Sebastian
