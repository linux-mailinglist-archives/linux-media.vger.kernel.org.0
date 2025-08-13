Return-Path: <linux-media+bounces-39789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C8B2467C
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E870D3AE87F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252382F6595;
	Wed, 13 Aug 2025 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWKUEwvp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044A21254E;
	Wed, 13 Aug 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078916; cv=none; b=J0o3oRhcF51kNv1T5mUUs6yr30BkUf63b7s57R+5adDi9dA40o0Pm/ISfdmrkQfHbmkIOmUevFXDu/jozYE7swOe0j06fYtV6uS+h/8bytzVX+k7HGtVrSkC8juEVnxhRVa0WQVkYUWWTSy5vMXTKO0ZVRJ0NWiMi5kT0gl005A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078916; c=relaxed/simple;
	bh=/TRxmXZpGNm+lj5XNarFCQkMqNUQwxyKU6HR9oiP31c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n+lTztzG2FcGo0YbPr3uGxjfRQQjOxfRipYEl+u+pLbO86oRA9Ubm7qXYdHHQlnYUpWa3sEd2WQstRfDH0hRD0mga+VYFEr7CVCLNmUTjli2DlDl62xJn35bDSdl6RsisboWXiRdD1q8CoCu0fLom0ave/xbwIt78hRVWB6X0pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWKUEwvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E318CC4CEF6;
	Wed, 13 Aug 2025 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078916;
	bh=/TRxmXZpGNm+lj5XNarFCQkMqNUQwxyKU6HR9oiP31c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oWKUEwvpuHyL037yPIYARBlLM1dceQoVCQo3xslGef9PJ5Qm1XXTtqMebucyHmNU0
	 5NY5wMLfkQ+PAGDcbO+TlwfdlUTxy6c3KsoK71m/C84/EMGeZWexnbP5CBKRq0l1S7
	 mS0rSsD+Y0yB9EkgZ3bx7zHe+FQmVOb54y4mgeSIaXU1PGZmlUT2oBUCkhocNoyML1
	 BDUTWkJDrYhj0e2bhvCDb83bP9glFfUqN48ZZlH/7MxYYKKpbG3gnsMfpFAfcRVM26
	 GqKgFDa14U4yGer2sHoq0RgSjV2oQ0TPdNSQLyN4VstP52B5tTYuv7zOcqAKq+l8cT
	 BHp1fO3X2laXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA29AC87FCF;
	Wed, 13 Aug 2025 09:55:15 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Subject: [PATCH v5 0/4] media: Add Gen 3 IP stateful decoder driver
Date: Wed, 13 Aug 2025 09:54:52 +0000
Message-Id: <20250813-allegro_dvt_al300_dec_driver-v5-0-a312ddebc4d8@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOxgnGgC/4XO32rDIByG4VspHs/gf+OOdh+jBKs/GyGNQ1NZK
 bn3mW6wso318Dt5vveKCuQIBT3vrihDjSWmuQ35tENutPMRcPRtI0aYJJJpbKcJjjkNvi6DnTg
 hgwc3+BwrZCxAS2uEDco71Ii3DCG+3/jXfdshpxNexgz2HuWUC0Z0p3rRU6zwxZYSZ+jS2cZS7
 MvXZXvsXDpt7hjLkvLlVl3Zpn9aisj/AyvDBFMIoucmyEDUT3yrrPxOpOqByJuovRbKHQzIYP4
 UxbeoH4qiiaHXjlBngj7IX+K6rh/94rn5uQEAAA==
X-Change-ID: 20250527-allegro_dvt_al300_dec_driver-4e75a94af6dc
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=47109;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=/TRxmXZpGNm+lj5XNarFCQkMqNUQwxyKU6HR9oiP31c=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWTMSWTw+ts6OWLBvjpvkZbSz8elldS89WZ/nnDrx4RHy
 8tFggx8O0pZGMS4GGTFFFk+GCx99oWtxmdGC9t8mDmsTCBDGLg4BWAisTcZ/nsJPlM4+9TuVOx8
 VpMtMiu8pvAyMmz6/zr87l2ubSEblsYw/OHt3Sq1MrhmuX/kBO31/xqmNOxVLT9UsCIg/9znkwZ
 3rjICAA==
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

This patch series introduces a new stateful decoder driver for the
allegrodvt GEN 3 IPs.

Changes in v5:
- Fix the include issues.
- Fix the faulty warning, by adding the __maybe_unused attribute to the 'v4l2_al_dec_dt_match'.
- Fix the get_mcu_offset(), the physical address limit is set to the
  flat memory size ( 264GB ).
- Get the mcu physical addresses offset at al_common_setup_dma.
- Link to v4: https://lore.kernel.org/r/20250716-allegro_dvt_al300_dec_driver-v4-0-f87c01c9f7b5@allegrodvt.com

Changes in v4:
- Use debugfs instead of build time DEBUG (Michael Tretter).
- Add capture and output pixelformats and resolution to the debugfs.
- Support 64-bit of physical addresses, by configuring the mcu data and
  instruction offset registers.
- Link to v3: https://lore.kernel.org/r/20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com

Changes in v3:
- Remove blank line after description.(Krzysztof Kozlowski)
- Drop minItems on the reg property.(Krzysztof Kozlowski)
- Reword the patch 2 subject and description.(Krzysztof Kozlowski)
- Add the memory-region property to the example.(Krzysztof Kozlowski)
- Rename the reg-name "regs" with top. the first reg is the
  video-decoder top registers.(Krzysztof Kozlowski)
- Link to v2: https://lore.kernel.org/r/20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com

Changes in v2:
- patch 2:
- Change the YAML file name, use the existing vendor-prefix.
- Improuve the dt-bindings description.
- Change the device compatible identifier, from "allegrodvt, al300-vdec",
  to "allegro, al300-vdec"
- Simplify the register property specification,
  by using the simple min/max items constraint (Krzysztof Kozlowski)
- Remove the clock-names property. And remove it from the required
  properties list (Krzysztof Kozlowski) (Conor Dooley)
- Use the simple maxItems constraint for the memory-region property.
  Also for the firmware-name (Krzysztof Kozlowski)
- Example changes:
  - Use header provides definitions for the interrupts (Conor Dooley)
  - Improuve Interrupt specification using GIC constants (Conor Dooley)
  - Use generic node name "video-decoder" (Krzysztof Kozlowski) (Conor Dooley)
  - Remove unused label (Krzysztof Kozlowski)
  - Change clock reference from <&mcu_clock_dec> to <&mcu_core_clk>
  - Use hex format for reg property (Krzysztof Kozlowski) (Conor Dooley)
  - Reduce memory region size (Krzysztof Kozlowski) (Conor Dooley)

- patch 4: Fix code reviews (Nicolas Dufresne)
- MAINTAINERS: Remove my self from the "ALLEGRO DVT VIDEO IP CORE
  DRIVER".
  Link to v1: https://lore.kernel.org/all/20250523134207.68481-1-yassine.ouaissa@allegrodvt.com/

# V4L2 Video Decoder Driver System Description

** Hardware Architecture **

The system implements a heterogeneous computing architecture with two primary components:

- **Host Subsystem**: Linux-based CPU running the V4L2 framework and associated drivers
- **IP Subsystem**: Dedicated hardware containing an MCU and a hardware video CODEC

The communication between the two subsystems uses a shared DDR shared memory with bidirectional interrupt mechanism for synchronization.

The architecture is represented in the following diagram:

```
+---------------------+                  +----------------------+
|       Host          |                  |        IP            |
|                     |                  |                      |
|  +---------------+  |                  |  +----------------+  |
|  |               |  |   DDR Shared     |  |                |  |
|  | Linux Kernel  |<-|----------------->|->|     MCU        |  |
|  | (CPU)         |  |    Memory        |  |                |  |
|  |   +--------+  |  |                  |  +----------------+  |
|  |   |        |  |  |    IRQ when      |           ^          |
|  |   | V4L2   |  |<-|----new message-->|           |          |
|  |   | Drivers|  |  |                  |           |          |
|  |   |        |  |  |                  |           | APB      |
|  |   +--------+  |  |                  |           |          |
|  |               |  |                  |           v          |
|  +---------------+  |                  |  +----------------+  |
|                     |                  |  |                |  |
|                     |                  |  |     CODEC      |  |
|                     |                  |  |                |  |
|                     |                  |  |                |  |
+---------------------+                  +----------------------+
```

** Communication Protocol **

-- Current Implementation - Custom Mailbox --

The host CPU and MCU currently communicate through a custom mailbox protocol implemented over shared memory. The protocol operates as follows:

1. When the host has a new message for the MCU:
   - The host writes data to a dedicated shared memory region
   - The host triggers an interrupt to the MCU
   - The MCU reads the shared memory to obtain the message type and data

2. Similarly, when the MCU has a message for the host:
   - The MCU writes to the shared memory
   - The MCU triggers an interrupt to the host
   - The host reads the shared memory to process the message

-- Migration to RPMSG --

The custom mailbox implementation will be replaced by the standard Linux RPMSG framework.

** Driver Implementation **

This driver implements a V4L2-compliant stateful video decoder with the following characteristics:

-- Technical Specifications --

- **Codec Support**: AVC (H.264), HEVC (H.265), and JPEG
- **Resolution Support**: Up to 4K
- **Pixel Formats**:
  - Currently supported: V4L2_PIX_FMT_NV12, V4L2_PIX_FMT_NV16, V4L2_PIX_FMT_P010
  - Additional formats planned for future releases
- **Buffer Configuration**: Currently supports semi-planar format only; multiplanar support forthcoming

-- Initialization Sequence --

During probe, the driver performs the following operations:

1. Allocates memory for the MCU firmware
2. Loads the firmware into the allocated memory
3. Initializes the MCU by configuring internal registers (e.g BOOT_ADDR)
4. Establishes the shared memory communication interface (to be replaced by RPMSG)
5. Sets up interrupt handlers for MCU communication

-- Processing Model --

The driver implements a stateful decoding model with the following workflow:

-- Stream Initialization --

1. Upon `VIDIOC_STREAMON` on the OUTPUT queue:
   - The driver sends a context creation request to the MCU
   - This operation is blocking; the driver waits until the MCU responds with a context handler
   - The context handler is stored in a driver-maintained list for subsequent operations
   - Each context has its own unique handler to support multiple simultaneous streams

2. Initial stream analysis:
   - The driver submits the first compressed buffer (OUTPUT queue)
   - The MCU analyzes the stream and reports capability via:
     - `resolution_found_event`: Stream is supported, includes stream parameters
     - `error_event`: Stream format is unsupported or invalid

-- Decoding Pipeline --

1. After successful stream initialization and receiving the resolution_found_evt:
   - The driver can begin normal decoding operations
   - V4L2 framework can be informed of format requirements

2. For each compressed buffer (OUTPUT queue):
   - The driver submits buffer to MCU with the appropriate context handler
   - The MCU processes the buffer and sends `release_bitstream_evt` when complete
   - This event signals that the input buffer can be returned to the application

3. For each decoded buffer (CAPTURE queue):
   - The MCU fills the buffer with decoded frame data
   - The MCU sends `frame_buffer_decode_evt` with important metadata including:
     - Original source buffer timestamp
     - Flags
     - Timecode
     - Actual payload size (bytes used in the decoded frame)
   - This enables the driver to properly queue the filled buffer to the application

4. End-of-stream handling:
   - The MCU sends an event with `eos_evt` when reaching the end of stream
   - This allows proper handling of end-of-stream conditions

-- Multi-stream Support --

The driver architecture supports multiple simultaneous decoding contexts with the following characteristics:

1. Each context maintains separate state information
2. The driver manages multiple context handlers returned by the MCU
3. Buffer submissions include the appropriate context handler for routing
4. The system can decode multiple independent streams concurrently

-- Stream Termination --

When `VIDIOC_STREAMOFF` is called:

1. The driver sends a flush command to the MCU for the specific context
2. The driver issues a non-blocking destroy context message
3. All associated resources are released
4. The context handler is removed from the driver's context list

** Error Handling **

The driver implements comprehensive error handling including:

1. Firmware loading failures
2. MCU initialization errors
3. Context creation failures
4. Unsupported stream formats
5. Decoding errors reported by the MCU
6. Timeout handling for unresponsive hardware

** Memory Management **

The system uses the following memory management strategy:

1. Firmware memory is allocated during probe
2. Buffer memory is managed through the V4L2 buffer management interfaces
3. DMA-capable memory is used for buffer transfers between host and MCU
4. The driver properly synchronizes memory access to avoid coherency issues

** Future Enhancements **

Planned future enhancements include:

1. Migration from custom mailbox to RPMSG (in progress)
2. Support for additional pixel formats
3. Implementation of multiplanar buffer support

This comprehensive architecture enables efficient hardware-accelerated video decoding while adhering to standard V4L2 interfaces, making it suitable for upstream inclusion in the Linux kernel.

** Decoder Compliance Testing **

-- AVC and HEVC Fluster Report --

This section contains the compliance test results from Fluster framework for both AVC and HEVC decoders.
The reports validate the decoder's conformance to relevant standards and demonstrate compatibility with a wide range of video streams.

[FLUSTER REPORT FOR THE H.264]
 -- JVT-AVC_V1

| Test                     | FFmpeg-H.264-v4l2m2m |
| ------------------------ | -------------------- |
| TOTAL                    | 79/135               |
| TOTAL TIME               | 437.031s             |
| -                        | -                    |
| AUD_MW_E                 | OK                   |
| BA1_FT_C                 | OK                   |
| BA1_Sony_D               | OK                   |
| BA2_Sony_F               | OK                   |
| BA3_SVA_C                | OK                   |
| BA_MW_D                  | OK                   |
| BAMQ1_JVC_C              | OK                   |
| BAMQ2_JVC_C              | OK                   |
| BANM_MW_D                | OK                   |
| BASQP1_Sony_C            | OK                   |
| CABA1_Sony_D             | OK                   |
| CABA1_SVA_B              | OK                   |
| CABA2_Sony_E             | OK                   |
| CABA2_SVA_B              | OK                   |
| CABA3_Sony_C             | OK                   |
| CABA3_SVA_B              | OK                   |
| CABA3_TOSHIBA_E          | OK                   |
| cabac_mot_fld0_full      | ER                   |
| cabac_mot_frm0_full      | OK                   |
| cabac_mot_mbaff0_full    | ER                   |
| cabac_mot_picaff0_full   | KO                   |
| CABACI3_Sony_B           | OK                   |
| CABAST3_Sony_E           | OK                   |
| CABASTBR3_Sony_B         | OK                   |
| CABREF3_Sand_D           | ER                   |
| CACQP3_Sony_D            | OK                   |
| CAFI1_SVA_C              | ER                   |
| CAMA1_Sony_C             | ER                   |
| CAMA1_TOSHIBA_B          | ER                   |
| cama1_vtc_c              | ER                   |
| cama2_vtc_b              | ER                   |
| CAMA3_Sand_E             | ER                   |
| cama3_vtc_b              | ER                   |
| CAMACI3_Sony_C           | ER                   |
| CAMANL1_TOSHIBA_B        | ER                   |
| CAMANL2_TOSHIBA_B        | ER                   |
| CAMANL3_Sand_E           | ER                   |
| CAMASL3_Sony_B           | ER                   |
| CAMP_MOT_MBAFF_L30       | ER                   |
| CAMP_MOT_MBAFF_L31       | ER                   |
| CANL1_Sony_E             | OK                   |
| CANL1_SVA_B              | OK                   |
| CANL1_TOSHIBA_G          | OK                   |
| CANL2_Sony_E             | OK                   |
| CANL2_SVA_B              | OK                   |
| CANL3_Sony_C             | OK                   |
| CANL3_SVA_B              | OK                   |
| CANL4_SVA_B              | OK                   |
| CANLMA2_Sony_C           | ER                   |
| CANLMA3_Sony_C           | ER                   |
| CAPA1_TOSHIBA_B          | ER                   |
| CAPAMA3_Sand_F           | ER                   |
| CAPCM1_Sand_E            | OK                   |
| CAPCMNL1_Sand_E          | OK                   |
| CAPM3_Sony_D             | OK                   |
| CAQP1_Sony_B             | OK                   |
| cavlc_mot_fld0_full_B    | ER                   |
| cavlc_mot_frm0_full_B    | OK                   |
| cavlc_mot_mbaff0_full_B  | ER                   |
| cavlc_mot_picaff0_full_B | KO                   |
| CAWP1_TOSHIBA_E          | OK                   |
| CAWP5_TOSHIBA_E          | OK                   |
| CI1_FT_B                 | OK                   |
| CI_MW_D                  | OK                   |
| CVBS3_Sony_C             | OK                   |
| CVCANLMA2_Sony_C         | ER                   |
| CVFC1_Sony_C             | OK                   |
| CVFI1_Sony_D             | ER                   |
| CVFI1_SVA_C              | ER                   |
| CVFI2_Sony_H             | ER                   |
| CVFI2_SVA_C              | ER                   |
| CVMA1_Sony_D             | ER                   |
| CVMA1_TOSHIBA_B          | ER                   |
| CVMANL1_TOSHIBA_B        | ER                   |
| CVMANL2_TOSHIBA_B        | ER                   |
| CVMAPAQP3_Sony_E         | ER                   |
| CVMAQP2_Sony_G           | ER                   |
| CVMAQP3_Sony_D           | ER                   |
| CVMP_MOT_FLD_L30_B       | ER                   |
| CVMP_MOT_FRM_L31_B       | ER                   |
| CVNLFI1_Sony_C           | ER                   |
| CVNLFI2_Sony_H           | ER                   |
| CVPA1_TOSHIBA_B          | ER                   |
| CVPCMNL1_SVA_C           | OK                   |
| CVPCMNL2_SVA_C           | OK                   |
| CVSE2_Sony_B             | OK                   |
| CVSE3_Sony_H             | OK                   |
| CVSEFDFT3_Sony_E         | OK                   |
| CVWP1_TOSHIBA_E          | OK                   |
| CVWP2_TOSHIBA_E          | OK                   |
| CVWP3_TOSHIBA_E          | OK                   |
| CVWP5_TOSHIBA_E          | OK                   |
| FI1_Sony_E               | ER                   |
| FM1_BT_B                 | ER                   |
| FM1_FT_E                 | KO                   |
| FM2_SVA_C                | ER                   |
| HCBP1_HHI_A              | OK                   |
| HCBP2_HHI_A              | OK                   |
| HCMP1_HHI_A              | OK                   |
| LS_SVA_D                 | OK                   |
| MIDR_MW_D                | OK                   |
| MPS_MW_A                 | OK                   |
| MR1_BT_A                 | OK                   |
| MR1_MW_A                 | OK                   |
| MR2_MW_A                 | OK                   |
| MR2_TANDBERG_E           | OK                   |
| MR3_TANDBERG_B           | OK                   |
| MR4_TANDBERG_C           | OK                   |
| MR5_TANDBERG_C           | OK                   |
| MR6_BT_B                 | ER                   |
| MR7_BT_B                 | OK                   |
| MR8_BT_B                 | ER                   |
| MR9_BT_B                 | ER                   |
| MV1_BRCM_D               | OK                   |
| NL1_Sony_D               | OK                   |
| NL2_Sony_H               | OK                   |
| NL3_SVA_E                | OK                   |
| NLMQ1_JVC_C              | OK                   |
| NLMQ2_JVC_C              | OK                   |
| NRF_MW_E                 | OK                   |
| Sharp_MP_Field_1_B       | ER                   |
| Sharp_MP_Field_2_B       | ER                   |
| Sharp_MP_Field_3_B       | ER                   |
| Sharp_MP_PAFF_1r2        | ER                   |
| Sharp_MP_PAFF_2r         | ER                   |
| SL1_SVA_B                | OK                   |
| SP1_BT_A                 | ER                   |
| sp2_bt_b                 | ER                   |
| SVA_BA1_B                | OK                   |
| SVA_BA2_D                | OK                   |
| SVA_Base_B               | OK                   |
| SVA_CL1_E                | OK                   |
| SVA_FM1_E                | OK                   |
| SVA_NL1_B                | OK                   |
| SVA_NL2_E                | OK                   |
| -                        | -                    |
| Test                     | FFmpeg-H.264-v4l2m2m |
| TOTAL                    | 79/135               |
| TOTAL TIME               | 439.031s             |

NOTE: The ER (ERROR) streams are not supported by the decoder.
      The driver print error message "Unsupported stream"

- JVT-FR-EXT

| Test                | FFmpeg-H.264-v4l2m2m |
| ------------------- | -------------------- |
| TOTAL               | 23/69                |
| TOTAL TIME          | 182.362s             |
| -                   | -                    |
| alphaconformanceG   | OK                   |
| brcm_freh10         | ER                   |
| brcm_freh11         | ER                   |
| brcm_freh3          | OK                   |
| brcm_freh4          | ER                   |
| brcm_freh5          | ER                   |
| brcm_freh6          | ER                   |
| brcm_freh8          | OK                   |
| brcm_freh9          | OK                   |
| FREH10-1            | ER                   |
| FREH10-2            | ER                   |
| freh12_b            | OK                   |
| freh1_b             | OK                   |
| freh2_b             | OK                   |
| freh7_b             | ER                   |
| FREXT01_JVC_D       | ER                   |
| FREXT02_JVC_C       | ER                   |
| FRExt1_Panasonic_D  | OK                   |
| FREXT1_TANDBERG_A   | ER                   |
| FRExt2_Panasonic_C  | ER                   |
| FREXT2_TANDBERG_A   | ER                   |
| FRExt3_Panasonic_E  | OK                   |
| FREXT3_TANDBERG_A   | ER                   |
| FRExt4_Panasonic_B  | ER                   |
| FRExt_MMCO4_Sony_B  | OK                   |
| HCAFF1_HHI_B        | ER                   |
| HCAFR1_HHI_C        | OK                   |
| HCAFR2_HHI_A        | OK                   |
| HCAFR3_HHI_A        | OK                   |
| HCAFR4_HHI_A        | OK                   |
| HCAMFF1_HHI_B       | ER                   |
| HCHP1_HHI_B         | OK                   |
| HCHP2_HHI_A         | OK                   |
| HCHP3_HHI_A         | ER                   |
| Hi422FR10_SONY_A    | ER                   |
| Hi422FR11_SONY_A    | ER                   |
| Hi422FR12_SONY_A    | ER                   |
| Hi422FR13_SONY_A    | ER                   |
| Hi422FR14_SONY_A    | ER                   |
| Hi422FR15_SONY_A    | ER                   |
| Hi422FR1_SONY_A     | ER                   |
| Hi422FR2_SONY_A     | ER                   |
| Hi422FR3_SONY_A     | ER                   |
| Hi422FR4_SONY_A     | ER                   |
| Hi422FR6_SONY_A     | ER                   |
| Hi422FR7_SONY_A     | ER                   |
| Hi422FR8_SONY_A     | ER                   |
| Hi422FR9_SONY_A     | ER                   |
| Hi422FREXT16_SONY_A | ER                   |
| Hi422FREXT17_SONY_A | ER                   |
| Hi422FREXT18_SONY_A | ER                   |
| Hi422FREXT19_SONY_A | ER                   |
| HPCA_BRCM_C         | OK                   |
| HPCADQ_BRCM_B       | OK                   |
| HPCAFL_BRCM_C       | ER                   |
| HPCAFLNL_BRCM_C     | ER                   |
| HPCALQ_BRCM_B       | OK                   |
| HPCAMAPALQ_BRCM_B   | ER                   |
| HPCAMOLQ_BRCM_B     | ER                   |
| HPCANL_BRCM_C       | OK                   |
| HPCAQ2LQ_BRCM_B     | OK                   |
| HPCV_BRCM_A         | OK                   |
| HPCVFL_BRCM_A       | ER                   |
| HPCVFLNL_BRCM_A     | ER                   |
| HPCVMOLQ_BRCM_B     | ER                   |
| HPCVNL_BRCM_A       | OK                   |
| HVLCFI0_Sony_B      | ER                   |
| HVLCMFF0_Sony_B     | ER                   |
| HVLCPFF0_Sony_B     | ER                   |
| -                   | -                    |
| Test                | FFmpeg-H.264-v4l2m2m |
| TOTAL               | 23/69                |
| TOTAL TIME          | 182.362s             |

NOTE: The ER (ERROR) streams are not supported by the decoder.
      The driver print error message "Unsupported stream"

- JVT-MVC

| Test       | FFmpeg-H.264-v4l2m2m |
| ---------- | -------------------- |
| TOTAL      | 18/20                |
| TOTAL TIME | 147.076s             |
| -          | -                    |
| MVCDS-4    | OK                   |
| MVCDS-5    | OK                   |
| MVCDS-6    | OK                   |
| MVCDS1     | OK                   |
| MVCDS2     | OK                   |
| MVCDS3     | OK                   |
| MVCICT-1   | ER                   |
| MVCICT-2   | ER                   |
| MVCNV-2    | OK                   |
| MVCNV-3    | OK                   |
| MVCNV1     | OK                   |
| MVCNV4     | OK                   |
| MVCRP_1    | OK                   |
| MVCRP_2    | OK                   |
| MVCRP_3    | OK                   |
| MVCRP_4    | OK                   |
| MVCRP_5    | OK                   |
| MVCRP_6    | OK                   |
| MVCSPS-1   | OK                   |
| MVCSPS-2   | OK                   |
| -          | -                    |
| Test       | FFmpeg-H.264-v4l2m2m |
| TOTAL      | 18/20                |
| TOTAL TIME | 147.076s             |

- JVT-SVC

| Test            | FFmpeg-H.264-v4l2m2m |
| --------------- | -------------------- |
| TOTAL           | 75/185               |
| TOTAL TIME      | 727.240s             |
| -               | -                    |
| SVCBC-1-L0      | OK                   |
| SVCBC-1-L1      | KO                   |
| SVCBCT-1-L0     | OK                   |
| SVCBCT-1-L1     | KO                   |
| SVCBCTS-1-r1-L0 | OK                   |
| SVCBCTS-1-r1-L1 | KO                   |
| SVCBCTS-1-r1-L2 | KO                   |
| SVCBCTS-2-r1-L0 | OK                   |
| SVCBCTS-2-r1-L1 | KO                   |
| SVCBCTS-2-r1-L2 | KO                   |
| SVCBCTS-3-L0    | OK                   |
| SVCBCTS-3-L1    | KO                   |
| SVCBCTS-3-L2    | KO                   |
| SVCBM-1-L0      | OK                   |
| SVCBM-1-L1      | KO                   |
| SVCBM-2-L0      | OK                   |
| SVCBM-2-L1      | KO                   |
| SVCBM-3-L0      | OK                   |
| SVCBM-3-L1      | KO                   |
| SVCBM-4-r1-L0   | OK                   |
| SVCBM-4-r1-L1   | KO                   |
| SVCBM-4-r1-L2   | KO                   |
| SVCBM-5-L0      | OK                   |
| SVCBM-5-L1      | KO                   |
| SVCBM-5-L2      | KO                   |
| SVCBM-5-L3      | KO                   |
| SVCBMST-1-L0    | OK                   |
| SVCBMST-1-L1    | KO                   |
| SVCBMST-1-L2    | KO                   |
| SVCBMST-2-L0    | OK                   |
| SVCBMST-2-L1    | KO                   |
| SVCBMST-2-L2    | KO                   |
| SVCBMST-3-L0    | OK                   |
| SVCBMST-3-L1    | KO                   |
| SVCBMST-3-L2    | KO                   |
| SVCBMT-1-L0     | OK                   |
| SVCBMT-1-L1     | KO                   |
| SVCBMT-10-L0    | OK                   |
| SVCBMT-10-L1    | KO                   |
| SVCBMT-11-L0    | OK                   |
| SVCBMT-11-L1    | KO                   |
| SVCBMT-12-L0    | OK                   |
| SVCBMT-12-L1    | KO                   |
| SVCBMT-13-L0    | OK                   |
| SVCBMT-13-L1    | KO                   |
| SVCBMT-13-L2    | KO                   |
| SVCBMT-2-L0     | OK                   |
| SVCBMT-2-L1     | KO                   |
| SVCBMT-3-L0     | OK                   |
| SVCBMT-3-L1     | KO                   |
| SVCBMT-4-L0     | OK                   |
| SVCBMT-4-L1     | KO                   |
| SVCBMT-5-L0     | OK                   |
| SVCBMT-5-L1     | KO                   |
| SVCBMT-6-L0     | OK                   |
| SVCBMT-6-L1     | KO                   |
| SVCBMT-7-L0     | OK                   |
| SVCBMT-7-L1     | KO                   |
| SVCBMT-8-L0     | OK                   |
| SVCBMT-8-L1     | KO                   |
| SVCBMT-9-L0     | OK                   |
| SVCBMT-9-L1     | KO                   |
| SVCBS-1-L0      | OK                   |
| SVCBS-1-L1      | KO                   |
| SVCBS-2-L0      | OK                   |
| SVCBS-2-L1      | KO                   |
| SVCBS-3-r1-L0   | OK                   |
| SVCBS-3-r1-L1   | KO                   |
| SVCBS-4-r1-L0   | OK                   |
| SVCBS-4-r1-L1   | KO                   |
| SVCBS-5-r1-L0   | OK                   |
| SVCBS-5-r1-L1   | KO                   |
| SVCBS-6-r1-L0   | OK                   |
| SVCBS-6-r1-L1   | KO                   |
| SVCBS-6-r1-L2   | KO                   |
| SVCBS-7-L0      | OK                   |
| SVCBS-7-L1      | KO                   |
| SVCBS-8-L0      | OK                   |
| SVCBS-8-L1      | KO                   |
| SVCBST-1-L0     | OK                   |
| SVCBST-1-L1     | KO                   |
| SVCBST-10-r1-L0 | OK                   |
| SVCBST-10-r1-L1 | KO                   |
| SVCBST-11-r1-L0 | OK                   |
| SVCBST-11-r1-L1 | KO                   |
| SVCBST-12-r1-L0 | OK                   |
| SVCBST-12-r1-L1 | KO                   |
| SVCBST-13-L0    | OK                   |
| SVCBST-13-L1    | KO                   |
| SVCBST-14-L0    | OK                   |
| SVCBST-14-L1    | KO                   |
| SVCBST-14-L2    | KO                   |
| SVCBST-15-L0    | OK                   |
| SVCBST-15-L1    | KO                   |
| SVCBST-15-L2    | KO                   |
| SVCBST-16-r1-L0 | OK                   |
| SVCBST-16-r1-L1 | KO                   |
| SVCBST-16-r1-L2 | KO                   |
| SVCBST-17-r1-L0 | OK                   |
| SVCBST-17-r1-L1 | KO                   |
| SVCBST-17-r1-L2 | KO                   |
| SVCBST-18-r1-L0 | OK                   |
| SVCBST-18-r1-L1 | KO                   |
| SVCBST-18-r1-L2 | KO                   |
| SVCBST-19-L0    | OK                   |
| SVCBST-19-L1    | KO                   |
| SVCBST-2-L0     | OK                   |
| SVCBST-2-L1     | KO                   |
| SVCBST-20-L0    | OK                   |
| SVCBST-20-L1    | KO                   |
| SVCBST-3-L0     | OK                   |
| SVCBST-3-L1     | KO                   |
| SVCBST-4-L0     | OK                   |
| SVCBST-4-L1     | KO                   |
| SVCBST-5-L0     | OK                   |
| SVCBST-5-L1     | KO                   |
| SVCBST-6-r1-L0  | OK                   |
| SVCBST-6-r1-L1  | KO                   |
| SVCBST-7-r1-L0  | OK                   |
| SVCBST-7-r1-L1  | KO                   |
| SVCBST-8-r1-L0  | OK                   |
| SVCBST-8-r1-L1  | KO                   |
| SVCBST-9-r1-L0  | OK                   |
| SVCBST-9-r1-L1  | KO                   |
| SVCBSTC-1-L0    | OK                   |
| SVCBSTC-1-L1    | KO                   |
| SVCBSTC-1-L2    | KO                   |
| SVCHCTS-1-r1-L0 | OK                   |
| SVCHCTS-1-r1-L1 | KO                   |
| SVCHCTS-1-r1-L2 | KO                   |
| SVCHCTS-1-r1-L3 | KO                   |
| SVCHCTS-1-r1-L4 | KO                   |
| SVCHCTS-1-r1-L5 | KO                   |
| SVCHCTS-1-r1-L6 | KO                   |
| SVCHCTS-1-r1-L7 | KO                   |
| SVCHICS-1-L0    | OK                   |
| SVCHICS-1-L1    | KO                   |
| SVCHICS-1-L2    | KO                   |
| SVCHICS-1-L3    | KO                   |
| SVCHIS-1-L0     | OK                   |
| SVCHIS-1-L1     | KO                   |
| SVCHIS-1-L2     | KO                   |
| SVCHIS-2-L0     | OK                   |
| SVCHIS-2-L1     | KO                   |
| SVCHIS-2-L2     | KO                   |
| SVCHIS-3-L0     | OK                   |
| SVCHIS-3-L1     | KO                   |
| SVCHIS-3-L2     | KO                   |
| SVCHM-1-L0      | OK                   |
| SVCHM-1-L1      | KO                   |
| SVCHM-1-L2      | KO                   |
| SVCHM-1-L3      | KO                   |
| SVCHM-2-L0      | OK                   |
| SVCHM-2-L1      | OK                   |
| SVCHM-3-L0      | OK                   |
| SVCHM-3-L1      | OK                   |
| SVCHM-4-L0      | OK                   |
| SVCHM-4-L1      | OK                   |
| SVCHM-4-L2      | OK                   |
| SVCHMTS-1-r1-L0 | OK                   |
| SVCHMTS-1-r1-L1 | KO                   |
| SVCHMTS-1-r1-L2 | KO                   |
| SVCHMTS-1-r1-L3 | KO                   |
| SVCHMTS-1-r1-L4 | KO                   |
| SVCHMTS-1-r1-L5 | KO                   |
| SVCHMTS-2-r1-L0 | OK                   |
| SVCHMTS-2-r1-L1 | KO                   |
| SVCHMTS-2-r1-L2 | KO                   |
| SVCHS-1-r1-L0   | OK                   |
| SVCHS-1-r1-L1   | KO                   |
| SVCHS-2-r1-L0   | OK                   |
| SVCHS-2-r1-L1   | KO                   |
| SVCHST-1-r1-L0  | OK                   |
| SVCHST-1-r1-L1  | KO                   |
| SVCHST-1-r1-L2  | KO                   |
| SVCHST-2-r1-L0  | OK                   |
| SVCHST-2-r1-L1  | KO                   |
| SVCHST-2-r1-L2  | KO                   |
| SVCHST-3-r1-L0  | ER                   |
| SVCHST-3-r1-L1  | ER                   |
| SVCHST-4-r1-L0  | ER                   |
| SVCHST-4-r1-L1  | ER                   |
| SVCHSTC-1-r1-L0 | OK                   |
| SVCHSTC-1-r1-L1 | KO                   |
| SVCHSTC-1-r1-L2 | KO                   |
| -               | -                    |
| Test            | FFmpeg-H.264-v4l2m2m |
| TOTAL           | 75/185               |
| TOTAL TIME      | 727.240s             |

NOTE: The current implementation of the decoder only supports Layer 0 (base layer) processing.
When attempting to decode streams that contain multiple layers (such as scalable or multi-view content), the decoding operation fails.
This limitation means that enhanced features requiring layer-based processing beyond the base layer cannot be properly handled by the current decoder.
For successful decoding, input streams must be limited to single-layer content only.

[FLUSTER REPORT FOR THE H.265]

| -                               | -                    |
| AMP_A_Samsung_7                 | OK                   |
| AMP_B_Samsung_7                 | OK                   |
| AMP_D_Hisilicon_3               | OK                   |
| AMP_E_Hisilicon_3               | OK                   |
| AMP_F_Hisilicon_3               | ER                   |
| AMVP_A_MTK_4                    | ER                   |
| AMVP_B_MTK_4                    | OK                   |
| AMVP_C_Samsung_7                | ER                   |
| BUMPING_A_ericsson_1            | OK                   |
| CAINIT_A_SHARP_4                | OK                   |
| CAINIT_B_SHARP_4                | OK                   |
| CAINIT_C_SHARP_3                | OK                   |
| CAINIT_D_SHARP_3                | OK                   |
| CAINIT_E_SHARP_3                | OK                   |
| CAINIT_F_SHARP_3                | OK                   |
| CAINIT_G_SHARP_3                | OK                   |
| CAINIT_H_SHARP_3                | OK                   |
| CIP_A_Panasonic_3               | OK                   |
| cip_B_NEC_3                     | OK                   |
| CIP_C_Panasonic_2               | OK                   |
| CONFWIN_A_Sony_1                | OK                   |
| DBLK_A_MAIN10_VIXS_4            | ER                   |
| DBLK_A_SONY_3                   | OK                   |
| DBLK_B_SONY_3                   | OK                   |
| DBLK_C_SONY_3                   | OK                   |
| DBLK_D_VIXS_2                   | OK                   |
| DBLK_E_VIXS_2                   | OK                   |
| DBLK_F_VIXS_2                   | OK                   |
| DBLK_G_VIXS_2                   | OK                   |
| DELTAQP_A_BRCM_4                | OK                   |
| DELTAQP_B_SONY_3                | OK                   |
| DELTAQP_C_SONY_3                | OK                   |
| DSLICE_A_HHI_5                  | OK                   |
| DSLICE_B_HHI_5                  | OK                   |
| DSLICE_C_HHI_5                  | OK                   |
| ENTP_A_QUALCOMM_1               | OK                   |
| ENTP_B_Qualcomm_1               | OK                   |
| ENTP_C_Qualcomm_1               | OK                   |
| EXT_A_ericsson_4                | OK                   |
| FILLER_A_Sony_1                 | OK                   |
| HRD_A_Fujitsu_3                 | OK                   |
| INITQP_A_Sony_1                 | OK                   |
| INITQP_B_Main10_Sony_1          | ER                   |
| ipcm_A_NEC_3                    | OK                   |
| ipcm_B_NEC_3                    | OK                   |
| ipcm_C_NEC_3                    | OK                   |
| ipcm_D_NEC_3                    | OK                   |
| ipcm_E_NEC_2                    | OK                   |
| IPRED_A_docomo_2                | OK                   |
| IPRED_B_Nokia_3                 | OK                   |
| IPRED_C_Mitsubishi_3            | OK                   |
| LS_A_Orange_2                   | OK                   |
| LS_B_Orange_4                   | OK                   |
| LTRPSPS_A_Qualcomm_1            | KO                   |
| MAXBINS_A_TI_5                  | OK                   |
| MAXBINS_B_TI_5                  | OK                   |
| MAXBINS_C_TI_5                  | OK                   |
| MERGE_A_TI_3                    | OK                   |
| MERGE_B_TI_3                    | OK                   |
| MERGE_C_TI_3                    | OK                   |
| MERGE_D_TI_3                    | OK                   |
| MERGE_E_TI_3                    | OK                   |
| MERGE_F_MTK_4                   | OK                   |
| MERGE_G_HHI_4                   | OK                   |
| MVCLIP_A_qualcomm_3             | OK                   |
| MVDL1ZERO_A_docomo_4            | OK                   |
| MVEDGE_A_qualcomm_3             | OK                   |
| NoOutPrior_A_Qualcomm_1         | OK                   |
| NoOutPrior_B_Qualcomm_1         | OK                   |
| NUT_A_ericsson_5                | OK                   |
| OPFLAG_A_Qualcomm_1             | OK                   |
| OPFLAG_B_Qualcomm_1             | OK                   |
| OPFLAG_C_Qualcomm_1             | OK                   |
| PICSIZE_A_Bossen_1              | OK                   |
| PICSIZE_B_Bossen_1              | ER                   |
| PICSIZE_C_Bossen_1              | OK                   |
| PICSIZE_D_Bossen_1              | ER                   |
| PMERGE_A_TI_3                   | OK                   |
| PMERGE_B_TI_3                   | OK                   |
| PMERGE_C_TI_3                   | OK                   |
| PMERGE_D_TI_3                   | OK                   |
| PMERGE_E_TI_3                   | OK                   |
| POC_A_Bossen_3                  | OK                   |
| PPS_A_qualcomm_7                | OK                   |
| PS_B_VIDYO_3                    | ER                   |
| RAP_A_docomo_6                  | OK                   |
| RAP_B_Bossen_2                  | OK                   |
| RPLM_A_qualcomm_4               | OK                   |
| RPLM_B_qualcomm_4               | OK                   |
| RPS_A_docomo_5                  | OK                   |
| RPS_B_qualcomm_5                | OK                   |
| RPS_C_ericsson_5                | OK                   |
| RPS_D_ericsson_6                | OK                   |
| RPS_E_qualcomm_5                | OK                   |
| RPS_F_docomo_2                  | OK                   |
| RQT_A_HHI_4                     | OK                   |
| RQT_B_HHI_4                     | OK                   |
| RQT_C_HHI_4                     | OK                   |
| RQT_D_HHI_4                     | OK                   |
| RQT_E_HHI_4                     | OK                   |
| RQT_F_HHI_4                     | OK                   |
| RQT_G_HHI_4                     | OK                   |
| SAO_A_MediaTek_4                | OK                   |
| SAO_B_MediaTek_5                | OK                   |
| SAO_C_Samsung_5                 | OK                   |
| SAO_D_Samsung_5                 | OK                   |
| SAO_E_Canon_4                   | OK                   |
| SAO_F_Canon_3                   | OK                   |
| SAO_G_Canon_3                   | OK                   |
| SAO_H_Parabola_1                | OK                   |
| SAODBLK_A_MainConcept_4         | OK                   |
| SAODBLK_B_MainConcept_4         | OK                   |
| SDH_A_Orange_4                  | OK                   |
| SLICES_A_Rovi_3                 | OK                   |
| SLIST_A_Sony_5                  | OK                   |
| SLIST_B_Sony_9                  | OK                   |
| SLIST_C_Sony_4                  | OK                   |
| SLIST_D_Sony_9                  | OK                   |
| SLPPLP_A_VIDYO_2                | ER                   |
| STRUCT_A_Samsung_7              | ER                   |
| STRUCT_B_Samsung_7              | ER                   |
| TILES_A_Cisco_2                 | ER                   |
| TILES_B_Cisco_1                 | ER                   |
| TMVP_A_MS_3                     | OK                   |
| TSCL_A_VIDYO_5                  | OK                   |
| TSCL_B_VIDYO_4                  | ER                   |
| TSKIP_A_MS_3                    | OK                   |
| TSUNEQBD_A_MAIN10_Technicolor_2 | ER                   |
| TUSIZE_A_Samsung_1              | OK                   |
| VPSID_A_VIDYO_2                 | ER                   |
| VPSSPSPPS_A_MainConcept_1       | KO                   |
| WP_A_MAIN10_Toshiba_3           | ER                   |
| WP_A_Toshiba_3                  | ER                   |
| WP_B_Toshiba_3                  | OK                   |
| WP_MAIN10_B_Toshiba_3           | ER                   |
| WPP_A_ericsson_MAIN10_2         | ER                   |
| WPP_A_ericsson_MAIN_2           | OK                   |
| WPP_B_ericsson_MAIN10_2         | ER                   |
| WPP_B_ericsson_MAIN_2           | OK                   |
| WPP_C_ericsson_MAIN10_2         | ER                   |
| WPP_C_ericsson_MAIN_2           | OK                   |
| WPP_D_ericsson_MAIN10_2         | ER                   |
| WPP_D_ericsson_MAIN_2           | OK                   |
| WPP_E_ericsson_MAIN10_2         | ER                   |
| WPP_E_ericsson_MAIN_2           | OK                   |
| WPP_F_ericsson_MAIN10_2         | ER                   |
| WPP_F_ericsson_MAIN_2           | OK                   |
| -                               | -                    |
| Test                            | FFmpeg-H.265-v4l2m2m |
| TOTAL                           | 120/147              |
| TOTAL TIME                      | 12669.641s           |

Failed streams :
 - VPSSPSPPS_A_MainConcept_1 : Failed due to evolutive dynamic resolution increases. The decoder cannot properly handle upward resolution changes within the same stream.
 - LTRPSPS_A_Qualcomm_1

Yassine Ouaissa (5):
  media: allegro-dvt: Move the current driver to a subdirectory
  dt-bindings: media: allegro-dvt: add decoder dt-bindings for Gen3 IP
  MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
  dt-bindings: vendor-prefixes: Update the description of allegro prefix
  media: allegro-dvt: Add Gen 3 IP stateful decoder driver

 .../bindings/media/allegro,al300-vdec.yaml    |   75 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +-
 MAINTAINERS                                   |    5 +-
 drivers/media/platform/allegro-dvt/Kconfig    |   17 +-
 drivers/media/platform/allegro-dvt/Makefile   |    6 +-
 .../media/platform/allegro-dvt/al300/Kconfig  |   23 +
 .../media/platform/allegro-dvt/al300/Makefile |    6 +
 .../allegro-dvt/al300/al_codec_common.c       |  754 ++++++++
 .../allegro-dvt/al300/al_codec_common.h       |  247 +++
 .../allegro-dvt/al300/al_codec_util.c         |  177 ++
 .../allegro-dvt/al300/al_codec_util.h         |  185 ++
 .../platform/allegro-dvt/al300/al_vdec_drv.c  | 1530 +++++++++++++++++
 .../platform/allegro-dvt/al300/al_vdec_drv.h  |   94 +
 .../media/platform/allegro-dvt/zynqmp/Kconfig |   17 +
 .../platform/allegro-dvt/zynqmp/Makefile      |    6 +
 .../allegro-dvt/{ => zynqmp}/allegro-core.c   |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c   |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h   |    0
 .../allegro-dvt/{ => zynqmp}/nal-h264.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-h264.h       |    0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.h       |    0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.h       |    0
 24 files changed, 3123 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Makefile
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-core.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)

--
2.30.2

---
Yassine Ouaissa (4):
      media: allegro-dvt: Move the current driver to a subdirectory
      dt-bindings: media: allegro: Add al300 decoder IPs
      dt-bindings: vendor-prefixes: Update the description of allegro prefix
      media: allegro-dvt: Add Gen 3 IP stateful decoder driver

 .../bindings/media/allegro,al300-vdec.yaml         |   76 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +-
 MAINTAINERS                                        |    4 +-
 drivers/media/platform/allegro-dvt/Kconfig         |   17 +-
 drivers/media/platform/allegro-dvt/Makefile        |    6 +-
 drivers/media/platform/allegro-dvt/al300/Kconfig   |   23 +
 drivers/media/platform/allegro-dvt/al300/Makefile  |    9 +
 .../platform/allegro-dvt/al300/al_codec_common.c   |  764 ++++++++++
 .../platform/allegro-dvt/al300/al_codec_common.h   |  252 ++++
 .../platform/allegro-dvt/al300/al_codec_dbgfs.c    |  229 +++
 .../platform/allegro-dvt/al300/al_codec_dbgfs.h    |   71 +
 .../platform/allegro-dvt/al300/al_codec_util.c     |  180 +++
 .../platform/allegro-dvt/al300/al_codec_util.h     |  196 +++
 .../media/platform/allegro-dvt/al300/al_vdec_drv.c | 1514 ++++++++++++++++++++
 .../media/platform/allegro-dvt/al300/al_vdec_drv.h |   98 ++
 drivers/media/platform/allegro-dvt/zynqmp/Kconfig  |   17 +
 drivers/media/platform/allegro-dvt/zynqmp/Makefile |    6 +
 .../allegro-dvt/{ => zynqmp}/allegro-core.c        |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c        |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h        |    0
 .../platform/allegro-dvt/{ => zynqmp}/nal-h264.c   |    0
 .../platform/allegro-dvt/{ => zynqmp}/nal-h264.h   |    0
 .../platform/allegro-dvt/{ => zynqmp}/nal-hevc.c   |    0
 .../platform/allegro-dvt/{ => zynqmp}/nal-hevc.h   |    0
 .../platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c   |    0
 .../platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h   |    0
 26 files changed, 3443 insertions(+), 21 deletions(-)
---
base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
change-id: 20250527-allegro_dvt_al300_dec_driver-4e75a94af6dc

Best regards,
-- 
Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>



