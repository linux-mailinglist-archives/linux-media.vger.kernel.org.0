Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5115928FEE1
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 09:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394544AbgJPHI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 03:08:29 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2]:35075 "EHLO smtp2-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394542AbgJPHI3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 03:08:29 -0400
Received: from [192.168.2.154] (unknown [176.141.220.129])
        (Authenticated sender: theedge789)
        by smtp2-g21.free.fr (Postfix) with ESMTPSA id 540532003C6
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 09:08:27 +0200 (CEST)
To:     linux-media@vger.kernel.org
From:   Fabien R <theedge456@free.fr>
Subject: Porting Avermedia a827 driver to kernel 5.8
Message-ID: <e580e3e4-8c8f-617a-4fc7-cf659955e683@free.fr>
Date:   Fri, 16 Oct 2020 09:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
As a learning purpose, I would like to port the very old driver to dvb-usb-v2.
I'm considering to start from the af9015.
Is it the right path ?
Any suggestions ?

--
Fabien
