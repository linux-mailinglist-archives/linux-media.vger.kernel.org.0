Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF5F1F1716
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 12:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgFHK7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 06:59:47 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48261 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgFHK7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 06:59:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iFVEjQQDuCKzeiFVHjllru; Mon, 08 Jun 2020 12:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591613984; bh=dxy+5QKlOnH0VK/b78g2tiASoQgjUAvm558syn+Vdoo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TMKXfqY5lubf6ftrnJb4Pnd3+69N+8/hTaJvf8/6lZCR1qb+dlhThctIITzjs143m
         u2dbggpwCNGWeZ2S8xLYKKH3fil7O8tkd2qMBCuW9i+xye1jtyTqV1L4C+0kWc/REt
         +9vs+qJAMm3pooFycyJHNNPQghdSPFa9NUFGGvyHVAkGcEqc6qU1MnhM4MkBNadIGA
         oCvpoMvGJm1PDjiJkjbbb4RZHjv1Gsnug4BKW576N3xHupohbZXEfdrwg58o/1vD4f
         4gs0Rweir3Qv2s9rvXGprCLOOCvNt40FATk64AD4YbnKB7socZ68e0Xj/CRrwCxqyw
         UZkw9wBAZf/Ng==
Subject: Re: [PATCH RESEND v9 17/18] media: platform: Rename existing
 functions/defines/variables
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com,
        sj.huang@mediatek.com
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-19-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5c0998e6-7274-4c7c-a44b-5d69eb9261a9@xs4all.nl>
Date:   Mon, 8 Jun 2020 12:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200604090553.10861-19-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB2wYAxrK0PCVDN02JkkKDlBvpsHrZA5zFmfkkZNlVGgZ+78BPGKLcXMxwawtEIYgaLoawkpu0k8QkYsPkCxvH/Lt0ZETpSdTr7AE7621Qk87/WbPine
 jW4G1iMnKK+KpgxKoUNYRKTL/GPW/j2IgDzE0FfQ9FUDkeCu+6MMaTjMlTb9CYAgFs6FaEh82eLp7XqlUu448f6RR/T4wcWe8Gb6kthch5tKWOwGAT2zHGAp
 D8KuJcl/9KfOsz23JvTUhrbEl6NfFtjFFkN42can+ApnQLMoY0uu9g3FKCGTmXKSCXgVBkPnRPKWWOE+MG8Cwj6D2xWAGdUuUF1TzV1OLtDD+siwWiWebTyg
 Sr8dmvhgwlFsTc8U2ZujQxccu9yEf8E+CR1VMGZVcKm/Ag2gMdviFzkMyUK+jy8Epb3VVlBNOPkmCIyt+RQ5ElRuSLyz6hPQbxEVVgVaAS+4TkeKdySgIFDE
 wr+7rJX3pUuXZDTikmIfK021diKOZAHbVFuDzQ13xdJ8eI4rTUxZZBJvcZbc9i3Hpx+raMm+/U9C9op8ZW6GWaFPRV2zEXmEz0+1z5sUMTfJg+jD9Pn6IyS5
 j8aU15r0LXvxMawyLUfzzV4ltMEkjKqSKOjwovZfXR4Q7rSijIjerJoZbhkWEjVFB3FejfPvDghmonjfoPq5TQAUKgm3oWI/kiYizxbPG+55PwSl31LBxxqT
 sCUul3Pd7ggjoQiQ/MZcovcDLL4ptb5NRESAJAnq5UVu9m6HbySyzSrcv1yzBvTsNqMZJ19YxCx6gZXw92C9PqRnV9saE1cUFxsrDOYDWCI6u6zZVdTUDA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2020 11:05, Xia Jiang wrote:
> Rename existing funcitons/defines/variables with a  _dec prefix and

Tiny typo: funcitons -> functions

> without dec_ prefix to prepare for the addition of the jpeg encoder
> feature.

Regards,

	Hans
