Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFABF75DD
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 15:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfKKOCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 09:02:37 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52635 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726853AbfKKOCh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 09:02:37 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UAH2iVJA8QBsYUAH5i6fxS; Mon, 11 Nov 2019 15:02:36 +0100
Subject: Re: general protection fault in vb2_mmap
To:     syzbot <syzbot+52e5bf0ebfa66092937a@syzkaller.appspotmail.com>,
        hansverk@cisco.com, kyungmin.park@samsung.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, mchehab+samsung@kernel.org,
        mchehab@kernel.org, pawel@osciak.com,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org
References: <000000000000d5dacd0596c1d41e@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bb399b87-8a06-6edb-200b-597a43485e2f@xs4all.nl>
Date:   Mon, 11 Nov 2019 15:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <000000000000d5dacd0596c1d41e@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH//5xB9dRYWbf8A9gNIjxE//XTKVYNTafCC/69AuxWWQZdTybCOgi1AccejzgEB6TOO4bdaytbwY6t97xgXeJY8oVkpdvxeGiL/37FqwQZIjyaHGWQX
 WsXenighWEjK3UXPXmI1Isg/BJcz2Q+BQrEABBV51ozlt6E2x9pyi7K4gZ9nqykVvnYGmkNRWjmWwkCnZkzhP8AAY/eHow6PRQe/bfveV0L6YeoVQqgWNyNX
 q/U4E7ivlTVDsVdsJfUT4dl4mnVPSmTU0WAMppztsJjiSOg8xwxo2lEehw7V9y9Vumo0xmvr0vHE0l1vZgaZJeDGSVgahelkin4QtosBK1FeW8D8WL6wUQuI
 Mhiwkn7fNPlx845X9iM/dZO2qTii6onAyzVpk7MCVTQnLdMdkISADzKS8NsiTgv534aWpZGVQSBioLULCUZolUDuMe014tvkQqYTBJFCgGI3vwVCxUuMCLQP
 aOkDVosgwTqr+dYddbIOGAB5FO5/8tXTE4Uv/t/Gi9N1iEKVg6Ht/+s9jRnAfdFpYcD2P/ZcbnhkgVtTeel3Ib55JM8S9LXUYLILJg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

#syz fix: media: vb2: vb2_mmap: move lock up
