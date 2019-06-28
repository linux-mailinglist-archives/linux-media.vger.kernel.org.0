Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532AD5959F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 10:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfF1IGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 04:06:42 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59721 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726734AbfF1IGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 04:06:42 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id gltthk77qSfvXgltwhQpwi; Fri, 28 Jun 2019 10:06:40 +0200
Subject: Re: [PATCH 00/31] staging: bcm2835-camera: Improvements
To:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
Date:   Fri, 28 Jun 2019 10:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH5mWIQQ+78Ft5mokEb9dqgknieKCSU+WaLX+MeaWiZ5p3zjqcmUvQBpisGm3LIy6d4crj85Wc9aM3vkZWInMAGi+qqQ4uW8d3ZIqHCHLGX/KnSPsl9M
 vAduhvd2ME1dFsHoOmGryN8elr+I0oY5IdYFYmb9o1F4RuQtWM9z95P5jqkeplwDOtgSNMO23vOd4BK4OfsV8Z+D6V0CzES/Og6mI5xg+9j7njQxJ7zMGsaa
 6WkeXWbDSG8GPAmmgc7cjVbHpJMQaJ1WI29CzciOMfT8X2rKYrSYz6XMAqr1Vp5XZO+XbPemkoSC7UMlrOPKNcgbo7brPq3xN6giJSx+BDH8OeRgNhAtSPQI
 1u86xWxF2EPmMYnFIMdPYJypdPPSV05VUtctFPpEFW6XdV3mn7iDil/dTB9CZTOKBptAkqXpbjJqr//V8bCN2sHbMWyBqMXxRV1cBNsQlVTB1CFWZEccgNRS
 VFxkIpiet0MUVI7p
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On 6/27/19 8:55 PM, Stefan Wahren wrote:
> This is an attempt to help Dave Stevenson to get all the fixes and
> improvements of the bcm2835-camera driver into mainline.
> 
> Mostly i only polished the commit logs for upstream.
> 
> The series based on the latest bugfix V2 of staging: bcm2835-camera: Resto=
> re
> return behavior of ctrl_set_bitrate().

Thank you for working on this.

Three high-level questions:

1) Can you post the output of 'v4l2-compliance -s' using the latest v4l2-compliance
   from https://git.linuxtv.org/v4l-utils.git ?  I'm interested to see what the
   status is of this driver w.r.t. the compliance tests.

2) What is the status of this driver from your point of view? What is needed to
   get it out of staging?

3) Out of curiosity: is this driver still valid for RPi4?

Regards,

	Hans

> 
> Dave Stevenson (31):
>   staging: bcm2835-camera: Ensure H264 header bytes get a sensible
>     timestamp
>   staging: bcm2835-camera: Check the error for REPEAT_SEQ_HEADER
>   staging: bcm2835-camera: Replace spinlock protecting context_map with
>     mutex
>   staging: bcm2835-camera: Do not bulk receive from service thread
>   staging: bcm2835-camera: Correctly denote key frames in encoded data
>   staging: bcm2835-camera: Return early on errors
>   staging: bcm2835-camera: Remove dead email addresses
>   staging: bcm2835-camera: Fix comment style violations.
>   staging: bcm2835-camera: Fix spacing around operators
>   staging: bcm2835-camera: Reduce length of enum names
>   staging: bcm2835-camera: Fix multiple line dereference errors
>   staging: bcm2835-camera: Fix brace style issues.
>   staging: bcm2835-camera: Fix missing lines between items
>   staging: bcm2835-camera: Fix open parenthesis alignment
>   staging: bcm2835-camera: Ensure all buffers are returned on disable
>   staging: bcm2835-camera: Remove check of the number of buffers
>     supplied
>   staging: bcm2835-camera: Handle empty EOS buffers whilst streaming
>   staging: bcm2835-camera: Set sequence number correctly
>   staging: bcm2835-camera: Ensure timestamps never go backwards.
>   staging: bcm2835-camera: Add multiple inclusion protection to headers
>   staging: bcm2835-camera: Unify header inclusion defines
>   staging: bcm2835-camera: Fix multiple assignments should be avoided
>   staging: bcm2835-camera: Fix up mmal-parameters.h
>   staging: bcm2835-camera: Use enums for max value in controls
>   staging: bcm2835-camera: Correct V4L2_CID_COLORFX_CBCR behaviour
>   staging: bcm2835-camera: Remove/amend some obsolete comments
>   staging: mmal-vchiq: Avoid use of bool in structures
>   staging: bcm2835-camera: Fix stride on RGB3/BGR3 formats
>   staging: bcm2835-camera: Add sanity checks for queue_setup/CREATE_BUFS
>   staging: bcm2835-camera: Set the field value within ach buffer
>   staging: bcm2835-camera: Correct ctrl min/max/step/def to 64bit
> 
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 378 ++++++++++++----=
> -----
>  .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  34 +-
>  .../vc04_services/bcm2835-camera/controls.c        | 184 +++++-----
>  .../vc04_services/bcm2835-camera/mmal-common.h     |  12 +-
>  .../vc04_services/bcm2835-camera/mmal-encodings.h  |   9 +-
>  .../vc04_services/bcm2835-camera/mmal-msg-common.h |   9 +-
>  .../vc04_services/bcm2835-camera/mmal-msg-format.h | 104 +++---
>  .../vc04_services/bcm2835-camera/mmal-msg-port.h   | 133 ++++----
>  .../vc04_services/bcm2835-camera/mmal-msg.h        | 150 ++++----
>  .../vc04_services/bcm2835-camera/mmal-parameters.h | 286 +++++++++-------
>  .../vc04_services/bcm2835-camera/mmal-vchiq.c      | 159 +++++----
>  .../vc04_services/bcm2835-camera/mmal-vchiq.h      |  22 +-
>  12 files changed, 826 insertions(+), 654 deletions(-)
> 
> =2D-
> 2.7.4
> 

